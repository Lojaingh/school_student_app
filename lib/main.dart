import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'presentation/pages/login_screen.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}