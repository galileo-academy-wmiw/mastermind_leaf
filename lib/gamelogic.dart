import 'dart:math';

enum PinColor { red, yellow, green, blue, black, white, empty }

enum Answer {
  rightSpot,
  rightColor,
  wrong,
  empty;
}

void main() {
  List<PinColor> secretCode = generateNewCode();
  print(secretCode);

  List<PinColor> test = [
    PinColor.yellow,
    PinColor.green,
    PinColor.blue,
    PinColor.red
  ];
  print(test);

  print(compareAnswer(test, secretCode));
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
      combination.insert(i, PinColor.black);
    } else {
      combination.insert(i, PinColor.white);
    }
  }
  return combination;
}

//comparison function
List<Answer> compareAnswer(List<PinColor> pins, List<PinColor> combination) {
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
  return answers;
}