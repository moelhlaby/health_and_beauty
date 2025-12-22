import 'package:flutter/material.dart';

extension SizeBoxExtensions on num {
  SizedBox get sizeBoxH => SizedBox(height: toDouble());
  SizedBox get sizeBoxW => SizedBox(width: toDouble());
}
