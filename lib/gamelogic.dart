import 'dart:math';

enum PinColor{
  red, yellow, green, blue, black, white, empty
}

enum Answer{
  rightSpot, rightColor, wrong, empty;
}

class GameLogic{
  //initialize class
  List<List<PinColor>> pins = [];
  List<PinColor> combination = [];
  int turn = 0;

  GameLogic(int gameLength){
    //first, build a list for all the answers
    pins = [];

    for(int i = 0; i < gameLength; i++){
      for(int j = 0; j < 4; j++){
        pins[i][j] = PinColor.empty;
      }
    }

    //generate a combination
    combination = generateCombination();
  }

  //combination generate function
  List <PinColor> generateCombination(){
    List<PinColor> combination = [];
    for(int i = 0; i < 4; i++){
      int rand = Random().nextInt(6);

      //note: there's probably a better way to do this but it's literally my first time writing dart
      if(rand == 0){
        combination[i] = PinColor.red;
      }else if(rand == 1){
        combination[i] = PinColor.yellow;
      }else if(rand == 2){
        combination[i] = PinColor.green;
      }else if(rand == 3){
        combination[i] = PinColor.blue;
      }else if(rand == 4){
        combination[i] = PinColor.black;
      }else{
        combination[i] = PinColor.white;
      }
    }

    return combination;
  }


  //run game function

  //comparison function
  List <Answer> compareAnswer(){
    List <Answer> answers = [Answer.empty, Answer.empty, Answer.empty, Answer.empty];
    List <bool> checkedFields = [false, false, false, false];
    List <bool> checkedPins = [false, false, false, false];

    //check for full matches
    for(int i = 0; i < 4; i++){
      if(pins[turn][i] == combination[i]){
        answers[i] = Answer.rightSpot;
        checkedFields[i] = true;
        checkedPins[i] = true;
      }
    }

    //check for partial matches
    for(int i = 0; i <4; i++){//loop through pins
      for(int j = 0; j < 4; j++){//loop through combination
        if(!checkedFields[j] && !checkedPins[i] && pins[turn][i] == combination[j]){
          answers[j] = Answer.rightColor;
          checkedFields[j] = true;
          checkedPins[i] = true;
        }
      }
    }

    //set everything else up
    for(int i = 0; i < 4; i++){
      if(answers[i] == Answer.empty){
        answers[i] = Answer.wrong;
      }
    }

    answers.sort();
    return answers;
  }

}