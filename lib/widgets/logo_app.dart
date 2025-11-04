import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return Image.asset(
      isDarkMode
          ? 'assets/logo/logo_app_white.png'
          : 'assets/logo/logo_app.png',
      width: screenWidth * 0.6,
    );
  }
}
