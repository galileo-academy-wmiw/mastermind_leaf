import 'package:flutter/material.dart';

enum PinColor { empty, red, yellow, green, blue, purple, orange }

enum Answer {
  empty,
  wrong,
  rightColor,
  rightSpot,
}

//color lists used everywhere
List<Color> flutterCodePinColors = [
  Colors.black,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.orange
];

List<Color> flutterScorePinColors = [
  Colors.black, //empty
  Colors.red, //wrong
  Colors.yellow, //wrong spot
  Colors.green, //all good
];