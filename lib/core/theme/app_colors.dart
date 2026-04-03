import 'package:flutter/material.dart';

class AppColors {
  // هاد المتغير هو "المفتاح" اللي رح يتحكم فيه البلوك
  static bool isDarkMode = true; 

  static Color get scaffoldBg => isDarkMode ? const Color(0xFF1C1C1E) : const Color(0xFFF2F2F7);
  static Color get cardBg => isDarkMode ? const Color(0xFF2C2C2E) : Colors.white;
  static Color get fieldBg => isDarkMode ? const Color(0xFF3A3A3C) : const Color(0xFFE5E5EA);
  static Color get textWhite => isDarkMode ? Colors.white : const Color(0xFF1C1C1E);
  static Color get primaryYellow => const Color(0xFFFFD700); // ثابت
  static Color get textGrey => const Color(0xFF8E8E93); // ثابت
}