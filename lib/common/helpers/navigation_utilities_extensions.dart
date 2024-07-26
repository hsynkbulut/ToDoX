import 'package:flutter/material.dart';

extension NavigationUtilitiesExtensions on BuildContext {
  // Navigates to the specified screen
  void navigateToScreen(Widget screen) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}
