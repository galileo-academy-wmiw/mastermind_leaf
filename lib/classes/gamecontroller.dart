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
    List<int> internalCombination = [];
    bool isValidCode = false;

    while(!isValidCode){
      int rand = Random().nextInt(5);

      bool duplicateCheckFailed = false;
      if(internalCombination.isNotEmpty){
        for(int i = 0; i < internalCombination.length; i++){
          if(internalCombination[i] == rand){
            duplicateCheckFailed = true;
            print('duplicate check failed, internal combination: $internalCombination, rand: $rand');
          }
        }
        print(internalCombination);
      }

      if(!duplicateCheckFailed){
        internalCombination.add(rand);
      }

      if(internalCombination.length >= 4){
        isValidCode = true;
      }
    }
    print(internalCombination);

    //convert internal combination to codepins
    for(int i = 0; i < 4; i++){
      if(internalCombination[i] == 0){
        combination.add(PinColor.red);
      }else if(internalCombination[i] == 1){
        combination.add(PinColor.yellow);
      }else if(internalCombination[i] == 2){
        combination.add(PinColor.green);
      }else if(internalCombination[i] == 3){
        combination.add(PinColor.blue);
      }else if(internalCombination[i] == 4){
        combination.add(PinColor.purple);
      }else if(internalCombination[i] == 5){
        combination.add(PinColor.orange);
      }else{
        combination.add(PinColor.red);
        print('ERROR: invalid internalcombination value, setting color to red');
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