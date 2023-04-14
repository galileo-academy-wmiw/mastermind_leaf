
import 'package:audioplayers/audioplayers.dart';
import 'package:mastermind_leaf/library/settingFunctions.dart';
import 'package:flutter/material.dart';
import 'package:mastermind_leaf/main.dart';
import 'package:mastermind_leaf/library/styles.dart';
import 'package:mastermind_leaf/screens/game_screen.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

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
              image: AssetImage('assets/images/seagull.jpg'),
            ),
            FutureBuilder<int>(
              future: loadSettingsInt('settingTurns', 12),
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
                    audioPlayer.play(AssetSource('audio/introBleep.wav'));
                    gameController.startNewGame(snapshot.data);//turns hardcoded for now
                    gameScreen = GameScreen();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AppTree())
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
