import 'package:flutter/material.dart';

class StudentAppColors {
  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryLight = Color(0xFF5AA9F2);
  static const Color primaryDark = Color(0xFF123B66);
  static const Color navy = Color(0xFF0D1B2A);

  static const Color background = Color(0xFFF4F8FC);
  static const Color backgroundSoft = Color(0xFFEAF3FB);

  static const Color surface = Colors.white;
  static const Color surfaceGlass = Color(0xEFFFFFFF);

  static const Color textPrimary = Color(0xFF16263A);
  static const Color textSecondary = Color(0xFF718096);
  static const Color textHint = Color(0xFFA3AFBE);

  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);

  static const Color purple = Color(0xFF8B5CF6);
  static const Color teal = Color(0xFF14B8A6);
  static const Color orange = Color(0xFFF59E0B);
  static const Color pink = Color(0xFFEC4899);

  static const Color border = Color(0xFFDCE6F0);
}

class StudentAppGradients {
  static const LinearGradient primary = LinearGradient(
    colors: [
      StudentAppColors.navy,
      StudentAppColors.primaryDark,
      StudentAppColors.primary,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient icon = LinearGradient(
    colors: [
      StudentAppColors.primaryDark,
      StudentAppColors.primary,
      StudentAppColors.primaryLight,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
