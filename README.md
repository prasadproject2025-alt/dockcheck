# DockCheck

**Check deliveries at the dock, even with no signal. Get the proof to claim damage and shortages.**

Built for the Serverpod "Build Something Real" hackathon with Flutter and Serverpod 4.

## The problem

When a truck unloads at a warehouse, someone has to check that everything arrived and nothing is damaged. Loading docks often have no mobile signal, so the check happens on paper. Transport companies only accept damage and shortage claims within a short window and only with proof. Without a photo and a record made at the moment of delivery, the warehouse loses the money.

## How it works

1. **Supervisor** registers an expected shipment: truck, carrier, items and quantities, and the carrier's claim window.
2. **Dock worker** opens it on their phone, counts what came off the truck, flags damaged items and takes photos. This works with no connection. The receipt is saved on the device and syncs automatically when the signal returns.
3. **The server** compares received against expected, finds shortages, damage and extras, scores each 0-100, and stores the findings. Retrying a sync never duplicates anything.
4. **The supervisor** gets a live alert over a Serverpod stream, reviews the findings and photos, and generates a claim report for the carrier.
5. **Scheduled jobs** warn the supervisor before a claim window closes and flag carriers with repeated problems.

## Where Serverpod does the work

| Feature | Use |
| --- | --- |
| Authentication (email) | Sign-up and sign-in, two roles on top |
| Database + relations + migrations | Shipments, items, photos, discrepancies, alerts |
| Endpoints with transactions and row locks | Idempotent `submitReceipt`, safe if two phones sync the same shipment |
| Streaming endpoint + server events | Live supervisor alerts |
| File storage | Damage photos |
| Future calls (recurring) | Claim-deadline reminders, daily carrier summary |
| Serializable exceptions | Business-rule errors shown to the user |

## Run it

Requirements: Flutter, `serverpod_cli`. No Docker needed, the dev database is embedded.

```bash
cd dockcheck_server
serverpod start
```

The first user to sign up chooses a role. To become a supervisor, use the invite code `DOCK-SUPERVISOR` (change it with `supervisorInviteCode` in `config/passwords.yaml`). Development sign-in verification codes are printed in the server console.

On Windows, building the Flutter app for desktop needs Developer Mode enabled. Chrome and Android work without it.

### Demo script (offline)

1. Sign in as a supervisor, tap **Expect a shipment** (the form is pre-filled).
2. On a second device or browser profile, sign in as a worker.
3. Turn the **Offline** switch on. Open the shipment, set Carton A to 38 received and 1 damaged, add a photo, tap **Finish check**. It shows "Saved on this device".
4. Turn the switch off. The receipt syncs, and the supervisor's phone shows a HIGH risk alert immediately.
5. Open the alert, review the findings and photo, tap **Generate claim report**.

## Tests

```bash
cd dockcheck_server && dart test test/unit
cd dockcheck_flutter && flutter test
```

`dockcheck_server/test/integration/dock_flow_test.dart` exercises the full flow against the embedded test database.

## Honest notes

- Serverpod 4's experimental offline sync is not used. The offline queue is written for this app (local storage plus an idempotent receipt id), which keeps the behaviour predictable.
- The risk scoring is a simple, explainable formula (share of the line affected, plus a penalty for damage without photos), not machine learning.
