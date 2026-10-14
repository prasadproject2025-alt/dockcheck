# Flutter & Serverpod project

This project is a Flutter app (frontend) backed by a Serverpod server (backend). Always build the app's backend with Serverpod.
Build for multiple users, use Serverpod's built-in authentication, which is already set up in `lib/server.dart`.

The user starts the server and Flutter app with `serverpod start`. There is no need to check if the server is running: make the changes and call the `serverpod` MCP tools as needed. If the server is not running, an informative error message will be received from the MCP server. Then STOP and ask the user to start it. NEVER start the server yourself. The Flutter app is started along with it, or can be launched from the MCP tool `spawn_flutter_app`.

While running, `serverpod start` watches for file changes to run incremental code generation and hot reload both the server and the Flutter app.

Calling `serverpod generate` directly is not needed, but might be useful to troubleshoot when an incremental generation fails.

ALWAYS use the MCP server instead of the command line. Use the MCP server to:

- `create_migration` and `apply_migrations` for database (after you change data models).
- `create_repair_migration` if the database has drifted out of sync with the migrations.
- `tail_server_logs` to read logs from the server.
- `tail_flutter_logs` to read the raw stdout/stderr of the Flutter app.
- `hot_reload` / `hot_restart` to reload or restart the server and the Flutter app. ALWAYS call `hot_restart` after doing changes in the Flutter app that may not work with normal hot reload (which is automatically applied).
- `spawn_flutter_app` to start a Flutter app declared under `serverpod: flutter_apps:` in the server `pubspec.yaml`.
- `get_flutter_app_dtd` (Dart tooling daemon) for connecting to the app through the `dart` MCP.

NEVER edit generated code. The server's `lib/src/generated/` directory and the whole `dockcheck_client` package are rewritten by the code generator. Change the `.spy.yaml` models, the endpoints, or `lib/server.dart` instead.

Migrations are a narrow exception: the `migration.sql` of a generated migration MAY be edited by hand when the generated SQL would lose data — to add a data transformation, or to reach a destructive change through non-destructive steps. Never touch the other files in the migration directory, and keep the schema the SQL ends up with identical to `definition.sql` — new databases are created from that file and never run `migration.sql`.

Only when the server cannot be started at all, fall back to the CLI in the server package:

- `serverpod generate` to regenerate the client and the generated server code.
- `serverpod create-migration` after changing a model with a `table` (add `--force` for destructive changes). It only writes the migration; `serverpod start` applies pending migrations when it boots the server.

Tests need no Docker. `config/test.yaml` sets `database.dataPath`, so Serverpod starts and manages the test database (an embedded PostgreSQL) itself, and the project's `docker-compose.yaml` is not used for it. Just run `dart test` in the server package.

Checklist after doing changes, in this order:

- `dart analyze` (CLI)
- `dart format` (CLI)
- `create_migration` and `apply_migrations` (MCP - only if necessary)
- Do `serverpod` MCP `hot_restart` if required (hot reload is done automatically). Will also hot restart Flutter app
- Run tests, if applicable (`dart test` in the server package)
- Check `serverpod` MCP `tail_server_logs` and `tail_flutter_logs` for any issues.

If the user asks you to test the app:

1. Use `get_flutter_app_dtd` (`serverpod` MCP) to get the Flutter app's DTD
2. Pass the DTD to `connect_dart_tooling_daemon` (`dart` MCP) to connect to the app
3. Use `flutter_driver` (`dart` MCP) to navigate through the app

The app is launched from `dockcheck_flutter/lib/driver.dart`, which starts the Flutter driver extension with text entry emulation turned off so the app stays usable by hand. To let the driver type, set `enableTextEntryEmulation: true` there and `hot_restart` the app.

## About the app: DockCheck

DockCheck lets warehouse dock workers check an inbound delivery against what was expected, even with no signal, and gets supervisors the evidence to claim damage and shortages from the transport company.

Two roles, stored in `StaffProfile` (not auth scopes). Workers register freely; supervisors need the invite code (`supervisorInviteCode` in `config/passwords.yaml`, default `DOCK-SUPERVISOR` for demos).

Server (`dockcheck_server/lib/src/dock/`):
- Models (`*.spy.yaml`): `Shipment` -> `ShipmentItem` -> `DamagePhoto`, `Discrepancy`, `DockAlert`, `StaffProfile`, plus transfer types `NewShipment`, `Receipt`, `ReceiptLine`, `ClaimReport` and `DockException`.
- `analysis.dart`: pure functions that compare expected and received quantities and score each mismatch 0-100. Unit tested in `test/unit/analysis_test.dart`.
- `shipment_endpoint.dart`: create shipment (supervisor), `submitReceipt` (idempotent on `Receipt.receiptId`, locks the shipment row in a transaction, stores photos in `public` file storage, writes discrepancies, raises an alert), claim report generation.
- `alert_endpoint.dart`: stored alerts plus the `liveAlerts` stream, fed by `session.messages` on the `dock-alerts` channel.
- `deadline_scan_future_call.dart`: recurring future calls scheduled in `server.dart` (hourly claim-deadline reminders, daily per-carrier summary).
- `dock_access.dart`: role checks and `raiseAlert`.

Flutter (`dockcheck_flutter/lib/`):
- `state/dock_store.dart`: single `store`. Worker receipts are saved to the phone first (shared_preferences, photos as base64) and synced in order, retrying every 10 s. Shipments and profile are cached so the app opens offline. The "Offline" switch in the banner simulates no signal for demos.
- `screens/`: `staff_gate` (role picker), `worker_shell`, `receive_screen`, `supervisor_shell` (shipments + live alerts), `create_shipment_screen`, `shipment_detail_screen` (findings, photos, claim report).

Known limits: Serverpod 4's experimental offline sync is not used, the offline queue is our own. Photo uploads go through the endpoint (max 6 MB each, request limit 20 MB).

Integration tests in `test/integration/dock_flow_test.dart` cover the full flow. On the author's Windows machine the embedded test database failed to start under `dart test` (the harness and the server both try to start it), so run them where that works or against `serverpod start`.
