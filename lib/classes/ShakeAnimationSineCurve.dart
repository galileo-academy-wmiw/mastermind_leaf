import 'package:flutter/material.dart';
import 'dart:math';

class ShakeAnimationSineCurve extends Curve{
  ShakeAnimationSineCurve({this.count = 3});
  final double count;

  @override
  double transformInternal(double t) {
    return sin(count * 2 *pi * t);
  }
}
