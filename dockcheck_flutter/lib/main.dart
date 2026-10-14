import 'package:flutter/material.dart';

import 'client.dart';
import 'screens/sign_in_screen.dart';
import 'screens/staff_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeClient();
  runApp(const DockCheckApp());
}

/// Builds a theme for the given [brightness].
ThemeData _buildTheme(Brightness brightness) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE65100),
      brightness: brightness,
    ),
  );
}

class DockCheckApp extends StatelessWidget {
  const DockCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DockCheck',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const SignInScreen(child: StaffGate()),
    );
  }
}
