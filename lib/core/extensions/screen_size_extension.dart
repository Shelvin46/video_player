import 'package:flutter/material.dart';

extension ScreenSizeExtension on num {
  Widget get h => SizedBox(height: toDouble());
  Widget get w => SizedBox(width: toDouble());
}
