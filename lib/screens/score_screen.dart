import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/styles.dart';
import 'package:mastermind_leaf/library/global_variables.dart';
import 'package:mastermind_leaf/library/setting_functions.dart';
import 'package:mastermind_leaf/classes/code_pin.dart';
import 'package:mastermind_leaf/main.dart';
import 'package:mastermind_leaf/screens/game_screen.dart';

class ScoreScreen extends StatelessWidget {
  int turnsTaken;
  bool gameFinished;
  List<PinColor> combination;

  Future<int> settingTurns = loadSettingsInt('settingTurns', 12);

  ScoreScreen(this.gameFinished, this.turnsTaken, this.combination, {super.key});

  @override
  Widget build(BuildContext context) {
    if (gameFinished) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/images/sprites/Victory.png")),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CodePin(false, pinColorToFlutterColor(combination[0])),
                    CodePin(false, pinColorToFlutterColor(combination[1])),
                    CodePin(false, pinColorToFlutterColor(combination[2])),
                    CodePin(false, pinColorToFlutterColor(combination[3]))
                  ],
                ),
              ),
              Text(
                "you've taken $turnsTaken turns to save the treasures of the Pirate Ducks",
                style: paragraphStyle,
              ),
              FutureBuilder<int>(
                  future: settingTurns,
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                  return ElevatedButton(
                    style: startButtonStyle,
                      onPressed: () {
                      int printText = snapshot.data;
                      print('starting new game with $printText turns');
                        gameController.startNewGame(snapshot.data); //turns is currently hard coded
                        gameScreen = GameScreen();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const AppTree()));
                      },
                      child: Row(
                        children: const [
                          Text('Play Again?')
                        ],
                      )
                  );
                }
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/sprites/Defeat.png')),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CodePin(false, pinColorToFlutterColor(combination[0])),
                    CodePin(false, pinColorToFlutterColor(combination[1])),
                    CodePin(false, pinColorToFlutterColor(combination[2])),
                    CodePin(false, pinColorToFlutterColor(combination[3]))
                  ],
                ),
              ),
              const Text(
                "you've been defeated by the evil Captain Seagull",
                style: paragraphStyle,
              ),
              FutureBuilder<int>(
                  future: settingTurns,
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    return ElevatedButton(
                        style: startButtonStyle,
                        onPressed: () {
                          int printText = snapshot.data;
                          print('starting new game with $printText turns');
                          gameController.startNewGame(snapshot.data); //turns is currently hard coded
                          gameScreen = GameScreen();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const AppTree()));
                        },
                        child: Row(
                          children: const [
                            Text('Play Again?')
                          ],
                        )
                    );
                  }
              )
            ],
          ),
        ),
      );
    }
  }
}
