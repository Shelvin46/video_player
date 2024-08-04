import 'package:flutter/material.dart';

extension CustomGestureDetectorExtension on Widget {
  Widget customGestureDetector({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(
            8.0), // Add some padding to increase the touchable area
        child: this,
      ),
    );
  }
}
