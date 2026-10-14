import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';

/// Channel used to push [DockAlert]s to connected supervisors.
const dockAlertChannel = 'dock-alerts';

/// Returns the signed-in user's [StaffProfile], or null if they have not
/// picked a role yet.
Future<StaffProfile?> currentStaff(Session session) async {
  final userId = session.authenticated?.authUserId;
  if (userId == null) return null;
  return StaffProfile.db.findFirstRow(
    session,
    where: (t) => t.authUserId.equals(userId),
  );
}

/// Throws unless the caller has a staff profile.
Future<StaffProfile> requireStaff(Session session) async {
  final staff = await currentStaff(session);
  if (staff == null) {
    throw DockException(message: 'Choose a role before using DockCheck.');
  }
  return staff;
}

/// Throws unless the caller is a supervisor.
Future<StaffProfile> requireSupervisor(Session session) async {
  final staff = await requireStaff(session);
  if (staff.role != StaffRoleType.supervisor) {
    throw DockException(message: 'Only supervisors can do this.');
  }
  return staff;
}

/// Stores an alert and pushes it to live supervisors.
Future<DockAlert> raiseAlert(
  Session session, {
  required int shipmentId,
  required String kind,
  required String title,
  required String message,
  required int severity,
}) async {
  final alert = await DockAlert.db.insertRow(
    session,
    DockAlert(
      shipmentId: shipmentId,
      kind: kind,
      title: title,
      message: message,
      severity: severity,
    ),
  );
  await session.messages.postMessage(dockAlertChannel, alert);
  return alert;
}
