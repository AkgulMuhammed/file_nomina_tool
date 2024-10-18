import 'package:flutter/material.dart';

class AppColor {
  static Color primaryColor =
      const Color(0xFF3A86FF); // Mavi tonlarında bir ana renk
  static Color secondaryColor =
      const Color(0xFFFFBE0B); // Sarı tonlarında bir ikincil renk
  static Color white = const Color(0xFFFFFFFF); // Beyaz
  static Color black = const Color(0xFF000000); // Siyah
  static Color blackGrey = const Color(0xFF4A4A4A); // Siyah-gri karışımı
  static Color backgroundBlack = const Color(0xFF121212); // Arka plan siyah
  static Color backgroundWhite = const Color(0xFFF7F7F7); // Arka plan beyaz
  static Color backgroundGray = const Color(0xFFE0E0E0); // Arka plan gri
  static Color transparent = Colors.transparent; // Şeffaf

  static MaterialColor primarySwatch = const MaterialColor(
    0xFF3A86FF,
    {
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF3A86FF),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}
