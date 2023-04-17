
import 'package:audioplayers/audioplayers.dart';
import 'package:mastermind_leaf/library/global_variables.dart';
import 'package:mastermind_leaf/library/setting_functions.dart';
import 'package:flutter/material.dart';
import 'package:mastermind_leaf/main.dart';
import 'package:mastermind_leaf/library/styles.dart';
import 'package:mastermind_leaf/screens/game_screen.dart';


class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  Future<int> settingTurns = loadSettingsInt('settingTurns', 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
               child: const Text('MasterMind', style: titleStyle,)
            ),
            const Image(
              image: AssetImage('assets/images/sprites/TitleScreen.png'),
            ),
            FutureBuilder<int>(
              future: settingTurns,
              builder: (BuildContext context,AsyncSnapshot snapshot) {
                return ElevatedButton(
                  style: startButtonStyle,
                  child: Column(
                    children: const [
                      Icon(Icons.arrow_forward),
                      Text('Start The Game')
                    ],
                  ),
                  onPressed: () {
                    int printText = snapshot.data;
                    print('starting new game with $printText turns');
                    if(soundEnabled){
                      audioPlayer.play(AssetSource('audio/introBleep.wav'));
                    }
                    gameController.startNewGame(snapshot.data);//turns hardcoded for now
                    gameScreen = GameScreen();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AppTree())
                    );
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
