import 'package:dockcheck_client/dockcheck_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../client.dart';
import '../state/dock_store.dart';
import '../widgets/common.dart';
import 'supervisor_shell.dart';
import 'worker_shell.dart';

/// Decides what a signed-in user sees: role picker, supervisor or worker app.
class StaffGate extends StatefulWidget {
  const StaffGate({super.key});

  @override
  State<StaffGate> createState() => _StaffGateState();
}

class _StaffGateState extends State<StaffGate> {
  @override
  void initState() {
    super.initState();
    store.addListener(_onChange);
    store.init().then((_) => store.loadProfile());
  }

  @override
  void dispose() {
    store.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!store.profileLoaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (store.profile == null) return const RoleScreen();
    return store.isSupervisor ? const SupervisorShell() : const WorkerShell();
  }
}

Future<void> signOut() async {
  await client.auth.signOutDevice();
  await store.reset();
}

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  final _name = TextEditingController();
  final _code = TextEditingController();
  StaffRoleType _role = StaffRoleType.worker;
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    _code.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    setState(() => _busy = true);
    try {
      await store.register(
        displayName: _name.text,
        role: _role,
        inviteCode: _code.text,
      );
      await store.loadProfile();
    } catch (e) {
      if (mounted) showMessage(context, errorText(e), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to DockCheck'),
        actions: [
          TextButton(onPressed: signOut, child: const Text('Sign out')),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: ListView(
            padding: const EdgeInsets.all(24),
            shrinkWrap: true,
            children: [
              Text(
                'Who are you on the dock?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _name,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SegmentedButton<StaffRoleType>(
                segments: const [
                  ButtonSegment(
                    value: StaffRoleType.worker,
                    label: Text('Dock worker'),
                    icon: Icon(Icons.inventory_2_outlined),
                  ),
                  ButtonSegment(
                    value: StaffRoleType.supervisor,
                    label: Text('Supervisor'),
                    icon: Icon(Icons.supervisor_account_outlined),
                  ),
                ],
                selected: {_role},
                onSelectionChanged: (s) => setState(() => _role = s.first),
              ),
              if (_role == StaffRoleType.supervisor) ...[
                const SizedBox(height: 16),
                TextField(
                  controller: _code,
                  decoration: const InputDecoration(
                    labelText: 'Supervisor invite code',
                    helperText: 'Ask your warehouse manager for the code.',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _busy ? null : _continue,
                child: _busy
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
