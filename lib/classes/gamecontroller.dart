import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/global-variables.dart';

class GameController {
  List<PinColor> combination = [
    PinColor.empty,
    PinColor.empty,
    PinColor.empty,
    PinColor.empty
  ];

  int turns = 0;

  void startNewGame(int turns) {
    this.turns = turns;
    combination = generateNewCode();
  }

  List<PinColor> generateNewCode() {
    List<PinColor> combination = [];
    List<int> internalCombination = [];
    bool isValidCode = false;

    while (!isValidCode) {
      int rand = Random().nextInt(5);

      bool duplicateCheckFailed = false;
      if (internalCombination.isNotEmpty) {
        for (int i = 0; i < internalCombination.length; i++) {
          if (internalCombination[i] == rand) {
            duplicateCheckFailed = true;
            print(
                'duplicate check failed, internal combination: $internalCombination, rand: $rand');
          }
        }
        print(internalCombination);
      }

      if (!duplicateCheckFailed) {
        internalCombination.add(rand);
      }

      if (internalCombination.length >= 4) {
        isValidCode = true;
      }
    }
    print(internalCombination);

    //convert internal combination to codepins
    for (int i = 0; i < 4; i++) {
      if (internalCombination[i] == 0) {
        combination.add(PinColor.red);
      } else if (internalCombination[i] == 1) {
        combination.add(PinColor.yellow);
      } else if (internalCombination[i] == 2) {
        combination.add(PinColor.green);
      } else if (internalCombination[i] == 3) {
        combination.add(PinColor.blue);
      } else if (internalCombination[i] == 4) {
        combination.add(PinColor.purple);
      } else if (internalCombination[i] == 5) {
        combination.add(PinColor.orange);
      } else {
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
