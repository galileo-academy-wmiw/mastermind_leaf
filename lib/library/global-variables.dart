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
List<AssetImage> sprites = [
  const AssetImage('assets/images/sprites/Skull.png'),
  const AssetImage('assets/images/sprites/RedGem.png'),
  const AssetImage('assets/images/sprites/YellowGem.png'),
  const AssetImage('assets/images/sprites/GreenGem.png'),
  const AssetImage('assets/images/sprites/BlueGem.png'),
  const AssetImage('assets/images/sprites/PurpleGem.png'),
  const AssetImage('assets/images/sprites/OrangeGem.png')
];

PinColor flutterColorToPinColor(Color flutterColor) {
  if (flutterColor == flutterCodePinColors[1]) {
    return PinColor.red;
  } else if (flutterColor == flutterCodePinColors[2]) {
    return PinColor.yellow;
  } else if (flutterColor == flutterCodePinColors[3]) {
    return PinColor.green;
  } else if (flutterColor == flutterCodePinColors[4]) {
    return PinColor.blue;
  } else if (flutterColor == flutterCodePinColors[5]) {
    return PinColor.purple;
  } else if (flutterColor == flutterCodePinColors[6]) {
    return PinColor.orange;
  } else {
    return PinColor.empty;
  }
}

Color pinColorToFlutterColor(PinColor pinColor){
  if(pinColor == PinColor.red){
    return flutterCodePinColors[1];
  }else if(pinColor == PinColor.yellow){
    return flutterCodePinColors[2];
  }else if(pinColor == PinColor.green){
    return flutterCodePinColors[3];
  }else if(pinColor == PinColor.blue){
    return flutterCodePinColors[4];
  }else if(pinColor == PinColor.purple){
    return flutterCodePinColors[5];
  }else if(pinColor == PinColor.orange){
    return flutterCodePinColors[6];
  }else{
    return flutterCodePinColors[0];
  }
}

Color answerToFlutterColor(Answer ans) {
  if (ans == Answer.empty) {
    return flutterCodePinColors[0];
  } else if (ans == Answer.wrong) {
    return flutterCodePinColors[1];
  } else if (ans == Answer.rightColor) {
    return flutterCodePinColors[2];
  } else if (ans == Answer.rightSpot) {
    return flutterCodePinColors[3];
  } else {
    //THIS SHOULD NEVER EVER HAPPEN, it's an emergency return path
    print('something went wrong in answerToFlutterColor, ans is $ans');
    return Colors.purple;
  }
}