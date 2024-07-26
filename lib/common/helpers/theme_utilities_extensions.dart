import 'package:flutter/material.dart';

extension ThemeUtilitiesExtensions on BuildContext {
  // Checks if the current theme is dark mode
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
