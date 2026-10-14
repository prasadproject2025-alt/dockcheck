import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dockcheck_client/dockcheck_client.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../client.dart';

/// What the worker counted for one item. Photos are kept as bytes so the whole
/// receipt can be stored on the phone while there is no signal.
class PendingLine {
  PendingLine({
    required this.shipmentItemId,
    required this.receivedQty,
    required this.damagedQty,
    this.note,
    List<Uint8List>? photos,
  }) : photos = photos ?? [];

  final int shipmentItemId;
  final int receivedQty;
  final int damagedQty;
  final String? note;
  final List<Uint8List> photos;

  Map<String, dynamic> toJson() => {
    'shipmentItemId': shipmentItemId,
    'receivedQty': receivedQty,
    'damagedQty': damagedQty,
    'note': note,
    'photos': photos.map(base64Encode).toList(),
  };

  factory PendingLine.fromJson(Map<String, dynamic> json) => PendingLine(
    shipmentItemId: json['shipmentItemId'] as int,
    receivedQty: json['receivedQty'] as int,
    damagedQty: json['damagedQty'] as int,
    note: json['note'] as String?,
    photos: [
      for (final p in json['photos'] as List) base64Decode(p as String),
    ],
  );
}

/// A receipt saved on the phone, waiting to reach the server. The
/// [receiptId] is generated once, so retrying a sync can never create a
/// duplicate on the server.
class PendingReceipt {
  PendingReceipt({
    required this.receiptId,
    required this.shipmentId,
    required this.recordedAt,
    required this.lines,
  });

  final String receiptId;
  final int shipmentId;
  final DateTime recordedAt;
  final List<PendingLine> lines;

  Receipt toReceipt() => Receipt(
    receiptId: receiptId,
    shipmentId: shipmentId,
    recordedAt: recordedAt,
    lines: [
      for (final l in lines)
        ReceiptLine(
          shipmentItemId: l.shipmentItemId,
          receivedQty: l.receivedQty,
          damagedQty: l.damagedQty,
          note: l.note,
          photos: [for (final p in l.photos) ByteData.sublistView(p)],
        ),
    ],
  );

  Map<String, dynamic> toJson() => {
    'receiptId': receiptId,
    'shipmentId': shipmentId,
    'recordedAt': recordedAt.toIso8601String(),
    'lines': lines.map((l) => l.toJson()).toList(),
  };

  factory PendingReceipt.fromJson(Map<String, dynamic> json) => PendingReceipt(
    receiptId: json['receiptId'] as String,
    shipmentId: json['shipmentId'] as int,
    recordedAt: DateTime.parse(json['recordedAt'] as String),
    lines: [
      for (final l in json['lines'] as List)
        PendingLine.fromJson(l as Map<String, dynamic>),
    ],
  );
}

class _OfflineException implements Exception {
  const _OfflineException();
}

/// App-wide state: who is signed in, the shipment list, alerts, and the
/// offline queue. Everything the worker does is saved locally first and
/// synced afterwards.
class DockStore extends ChangeNotifier {
  static const _kPending = 'pending_receipts';
  static const _kShipments = 'shipments_cache';
  static const _kProfile = 'profile_cache';

  StaffProfile? profile;
  bool profileLoaded = false;
  List<Shipment> shipments = [];
  List<DockAlert> alerts = [];
  List<PendingReceipt> pending = [];

  /// Demo switch: behaves exactly like having no signal.
  bool simulateOffline = false;
  bool _reachable = true;
  bool syncing = false;

  /// One-line message the UI shows once (sync result, rejected receipt).
  String? notice;

  bool _initialized = false;
  bool _liveRunning = false;
  Timer? _timer;
  Timer? _refreshDebounce;
  final _liveAlerts = StreamController<DockAlert>.broadcast();

  bool get offline => simulateOffline || !_reachable;
  bool get isSupervisor => profile?.role == StaffRoleType.supervisor;
  int get unreadAlerts => alerts.where((a) => a.readAt == null).length;

  /// Fires when the server pushes a new alert.
  Stream<DockAlert> get liveAlerts => _liveAlerts.stream;

  bool hasPending(int shipmentId) =>
      pending.any((p) => p.shipmentId == shipmentId);

  Shipment? shipmentById(int id) {
    for (final s in shipments) {
      if (s.id == id) return s;
    }
    return null;
  }

  /// Loads whatever is saved on the phone, then keeps retrying in the
  /// background.
  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final pendingJson = prefs.getString(_kPending);
      if (pendingJson != null) {
        pending = [
          for (final p in jsonDecode(pendingJson) as List)
            PendingReceipt.fromJson(p as Map<String, dynamic>),
        ];
      }
      final shipmentsJson = prefs.getString(_kShipments);
      if (shipmentsJson != null) {
        shipments = [
          for (final s in jsonDecode(shipmentsJson) as List)
            Shipment.fromJson(s as Map<String, dynamic>),
        ];
      }
      final profileJson = prefs.getString(_kProfile);
      if (profileJson != null) {
        profile = StaffProfile.fromJson(
          jsonDecode(profileJson) as Map<String, dynamic>,
        );
      }
    } catch (_) {
      // A damaged cache must never stop the app from starting.
    }
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (profile == null) return;
      if (pending.isNotEmpty) {
        syncPending();
      } else if (_reachable == false) {
        refresh();
      }
    });
    notifyListeners();
  }

  Future<T> _guard<T>(Future<T> Function() call) async {
    if (simulateOffline) throw const _OfflineException();
    try {
      final result = await call();
      if (!_reachable) {
        _reachable = true;
        notifyListeners();
      }
      return result;
    } on DockException {
      rethrow;
    } catch (_) {
      if (_reachable) {
        _reachable = false;
        notifyListeners();
      }
      rethrow;
    }
  }

  Future<void> loadProfile() async {
    try {
      profile = await _guard(() => client.staff.myProfile());
      await _saveProfile();
    } catch (_) {
      // Offline: keep the cached profile from init().
    }
    profileLoaded = true;
    notifyListeners();
    if (profile != null) {
      unawaited(refresh());
      if (isSupervisor) unawaited(startLiveAlerts());
    }
  }

  /// Throws [DockException] with a message the user can read.
  Future<void> register({
    required String displayName,
    required StaffRoleType role,
    String? inviteCode,
  }) async {
    profile = await _guard(
      () => client.staff.register(
        displayName: displayName,
        role: role,
        inviteCode: inviteCode,
      ),
    );
    await _saveProfile();
    notifyListeners();
    unawaited(refresh());
    if (isSupervisor) unawaited(startLiveAlerts());
  }

  Future<void> refresh() async {
    try {
      shipments = await _guard(() => client.shipment.listShipments());
      await _saveShipments();
      if (isSupervisor) {
        alerts = await _guard(() => client.alert.listAlerts());
      }
    } catch (_) {
      // Offline or a transient error: keep showing the cached data.
    }
    notifyListeners();
  }

  /// Saves the receipt on the phone first, then tries to send it.
  Future<void> queueReceipt(PendingReceipt receipt) async {
    pending.add(receipt);
    await _savePending();
    notifyListeners();
    unawaited(syncPending());
  }

  /// Sends queued receipts in order. Stops at the first network failure and
  /// keeps the rest for the next attempt.
  Future<void> syncPending() async {
    if (syncing || pending.isEmpty) return;
    syncing = true;
    notifyListeners();
    var synced = 0;
    for (final receipt in List.of(pending)) {
      try {
        await _guard(() => client.shipment.submitReceipt(receipt.toReceipt()));
        pending.remove(receipt);
        synced++;
      } on DockException catch (e) {
        // The server understood and refused it; retrying cannot help.
        pending.remove(receipt);
        notice = 'A receipt was rejected: ${e.message}';
      } catch (_) {
        break;
      }
    }
    syncing = false;
    await _savePending();
    if (synced > 0) {
      notice = synced == 1
          ? 'Synced 1 saved receipt to the server.'
          : 'Synced $synced saved receipts to the server.';
    }
    notifyListeners();
    await refresh();
  }

  void setSimulateOffline(bool value) {
    simulateOffline = value;
    notifyListeners();
    if (!value) {
      unawaited(syncPending());
      unawaited(refresh());
    }
  }

  Future<void> markAlertsRead() async {
    try {
      await _guard(() => client.alert.markAllRead());
      alerts = await _guard(() => client.alert.listAlerts());
    } catch (_) {}
    notifyListeners();
  }

  /// Opens the server's alert stream and reconnects whenever it drops.
  Future<void> startLiveAlerts() async {
    if (_liveRunning) return;
    _liveRunning = true;
    while (_liveRunning) {
      try {
        if (!simulateOffline) {
          await for (final alert in client.alert.liveAlerts()) {
            if (!alerts.any((a) => a.id == alert.id)) alerts.insert(0, alert);
            _liveAlerts.add(alert);
            notifyListeners();
            _refreshDebounce?.cancel();
            _refreshDebounce = Timer(
              const Duration(milliseconds: 400),
              () => refresh(),
            );
          }
        }
      } catch (_) {}
      if (!_liveRunning) break;
      await Future<void>.delayed(const Duration(seconds: 3));
    }
  }

  void clearNotice() => notice = null;

  /// Called on sign-out so the next user starts clean.
  Future<void> reset() async {
    _liveRunning = false;
    profile = null;
    profileLoaded = false;
    shipments = [];
    alerts = [];
    pending = [];
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_kPending);
      await prefs.remove(_kShipments);
      await prefs.remove(_kProfile);
    } catch (_) {}
    notifyListeners();
  }

  Future<void> _savePending() => _write(
    _kPending,
    jsonEncode(pending.map((p) => p.toJson()).toList()),
  );

  Future<void> _saveShipments() => _write(
    _kShipments,
    jsonEncode(shipments.map((s) => s.toJson()).toList()),
  );

  Future<void> _saveProfile() async {
    final p = profile;
    if (p == null) return;
    await _write(_kProfile, jsonEncode(p.toJson()));
  }

  Future<void> _write(String key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } catch (_) {
      // Local storage is best effort; the in-memory state still works.
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _refreshDebounce?.cancel();
    _liveRunning = false;
    _liveAlerts.close();
    super.dispose();
  }
}

/// The single store used by every screen.
final store = DockStore();

/// A random id for a new receipt, generated once when the worker saves it.
String newReceiptId() {
  final now = DateTime.now().microsecondsSinceEpoch;
  final rand = Random.secure().nextInt(1 << 32);
  return 'r-${now.toRadixString(36)}-${rand.toRadixString(36)}';
}
