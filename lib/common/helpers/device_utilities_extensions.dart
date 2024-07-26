// device_utilities_extensions.dart

import 'package:flutter/material.dart';

extension DeviceUtilitiesExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get appbarHeight => kToolbarHeight;
}
