import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/styles.dart';
import 'package:mastermind_leaf/library/global-variables.dart';
import 'package:mastermind_leaf/classes/code-pin.dart';

class ScoreScreen extends StatelessWidget {

  int turnsTaken;
  bool gameFinished;
  List<PinColor> combination;

  ScoreScreen(this.gameFinished, this.turnsTaken, this.combination);



  @override
  Widget build(BuildContext context) {
    if (gameFinished) {
      return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CodePin(false, pinColorToFlutterColor(combination[0])),
                    CodePin(false, pinColorToFlutterColor(combination[1])),
                    CodePin(false, pinColorToFlutterColor(combination[2])),
                    CodePin(false, pinColorToFlutterColor(combination[3]))
                  ],
                ),
                Text("you've taken $turnsTaken turns", style: paragraphStyle,),
              ],
            ),
          ),
        ),
      );
    }else{
      return Scaffold(
        body: Container(
          color: Colors.black87,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("you've taken 420 turns", style: paragraphStyle,)
              ],
            ),
          ),
        ),
      );
    }


  }

}
