import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'dock_access.dart';

/// Supervisor notifications: a stored history plus a live stream.
class AlertEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Most recent alerts first.
  Future<List<DockAlert>> listAlerts(Session session) async {
    await requireSupervisor(session);
    return DockAlert.db.find(
      session,
      orderByList: (t) => [t.createdAt.desc()],
      limit: 100,
    );
  }

  /// Marks every unread alert as read.
  Future<void> markAllRead(Session session) async {
    await requireSupervisor(session);
    final unread = await DockAlert.db.find(
      session,
      where: (t) => t.readAt.equals(null),
    );
    final now = DateTime.now().toUtc();
    await DockAlert.db.update(
      session,
      unread.map((a) => a.copyWith(readAt: now)).toList(),
    );
  }

  /// Pushes new alerts to the supervisor the moment the server raises them.
  Stream<DockAlert> liveAlerts(Session session) async* {
    await requireSupervisor(session);
    yield* session.messages.createStream<DockAlert>(dockAlertChannel);
  }
}
