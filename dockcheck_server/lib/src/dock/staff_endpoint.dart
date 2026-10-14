import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';
import 'dock_access.dart';

/// Role selection after sign-up. Dock workers register freely; supervisors
/// need the invite code the warehouse manager shares with them.
class StaffEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Demo fallback, override with `supervisorInviteCode` in passwords.yaml.
  static const _defaultInviteCode = 'DOCK-SUPERVISOR';

  /// The caller's profile, or null if they have not chosen a role yet.
  Future<StaffProfile?> myProfile(Session session) => currentStaff(session);

  /// Creates the caller's profile. Idempotent: returns the existing profile if
  /// one exists.
  Future<StaffProfile> register(
    Session session, {
    required String displayName,
    required StaffRoleType role,
    String? inviteCode,
  }) async {
    final existing = await currentStaff(session);
    if (existing != null) return existing;

    final name = displayName.trim();
    if (name.isEmpty) {
      throw DockException(message: 'Please enter your name.');
    }

    if (role == StaffRoleType.supervisor) {
      final expected =
          session.passwords['supervisorInviteCode'] ?? _defaultInviteCode;
      if (inviteCode?.trim() != expected) {
        throw DockException(message: 'Invalid supervisor invite code.');
      }
    }

    return StaffProfile.db.insertRow(
      session,
      StaffProfile(
        authUserId: session.authenticated!.authUserId,
        role: role,
        displayName: name,
      ),
    );
  }
}
