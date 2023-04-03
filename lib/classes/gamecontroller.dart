import 'dart:math';
import 'package:flutter/material.dart';

enum PinColor {empty, red, yellow, green, blue, purple, orange}

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
  Colors.black,//empty
  Colors.red,//wrong
  Colors.yellow,//wrong spot
  Colors.green,//all good
];

class GameController{
  List<PinColor> combination = [PinColor.empty, PinColor.empty, PinColor.empty, PinColor.empty];

  PinColor flutterColorToPinColor(Color flutterColor){
    if(flutterColor == flutterCodePinColors[1]){
      return PinColor.red;
    }else if(flutterColor == flutterCodePinColors[2]){
      return PinColor.yellow;
    }else if(flutterColor == flutterCodePinColors[3]){
      return PinColor.green;
    }else if(flutterColor == flutterCodePinColors[4]){
      return PinColor.blue;
    }else if(flutterColor == flutterCodePinColors[5]){
      return PinColor.purple;
    }else if(flutterColor == flutterCodePinColors[6]){
      return PinColor.orange;
    }else{
      return PinColor.empty;
    }
  }

  Color answerToFlutterColor(Answer ans){
    if(ans == Answer.empty){
      return flutterCodePinColors[0];
    }else if(ans == Answer.wrong){
      return flutterCodePinColors[1];
    }else if(ans == Answer.rightColor){
      return flutterCodePinColors[2];
    }else if(ans == Answer.rightSpot){
      return flutterCodePinColors[3];
    }else{
      //THIS SHOULD NEVER EVER HAPPEN, it's an emergency return path
      print('something went wrong in answerToFlutterColor, ans is $ans');
      return Colors.purple;
    }
  }

  void startNewGame(int turns) {
    combination = generateNewCode();
  }

  List<PinColor> generateNewCode() {
    List<PinColor> combination = [];
    for (int i = 0; i < 4; i++) {
      int rand = Random().nextInt(6);

      //note: there's probably a better way to do this but it's literally my first time writing dart
      if (rand == 0) {
        combination.insert(i, PinColor.red);
      } else if (rand == 1) {
        combination.insert(i, PinColor.yellow);
      } else if (rand == 2) {
        combination.insert(i, PinColor.green);
      } else if (rand == 3) {
        combination.insert(i, PinColor.blue);
      } else if (rand == 4) {
        combination.insert(i, PinColor.purple);
      } else {
        combination.insert(i, PinColor.orange);
      }
    }
    return combination;
  }

  //comparison function
  List<Answer> compareAnswer(List<PinColor> pins) {
    List<Answer> answers = [
      Answer.empty,
      Answer.empty,
      Answer.empty,
      Answer.empty
    ];
    List<bool> checkedFields = [false, false, false, false];
    List<bool> checkedPins = [false, false, false, false];

    //check for full matches
    for (int i = 0; i < 4; i++) {
      if (pins[i] == combination[i]) {
        answers[i] = Answer.rightSpot;
        checkedFields[i] = true;
        checkedPins[i] = true;
      }
    }

    //check for partial matches
    //loop through pins
    for (int i = 0; i < 4; i++) {
      //loop through combination
      for (int j = 0; j < 4; j++) {
        if (!checkedFields[j] && !checkedPins[i] && pins[i] == combination[j]) {
          answers[j] = Answer.rightColor;
          checkedFields[j] = true;
          checkedPins[i] = true;
        }
      }
    }

    //set everything else up
    for (int i = 0; i < 4; i++) {
      if (answers[i] == Answer.empty) {
        answers[i] = Answer.wrong;
      }
    }

    answers.sort(Enum.compareByIndex);
    print(combination);
    print(answers);
    return answers;
  }
}