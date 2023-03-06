import 'dart:math';

enum PinColor{
  red, yellow, green, blue, black, white, empty
}

class GameLogic{
  //initialize class

  GameLogic(int gameLength){
    //first, build a list for all the answers
    List<List<PinColor>> pins = [];

    for(int i = 0; i < gameLength; i++){
      for(int j = 0; j < 4; j++){
        pins[i][j] = PinColor.empty;
      }
    }

    //set up other vars
    int turn = 0;

    //generate a combination
    generateCombination();
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


}