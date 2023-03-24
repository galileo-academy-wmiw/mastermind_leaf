import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:mastermind_leaf/classes/gamecontroller.dart';
import 'package:mastermind_leaf/screens/game-screen.dart';
import 'package:mastermind_leaf/screens/info-screen.dart';
import 'package:mastermind_leaf/screens/score-screen.dart';
import 'package:mastermind_leaf/screens/start-screen.dart';
import 'package:mastermind_leaf/screens/settings-screen.dart';

GameController gameController = GameController();
AudioPlayer audioPlayer = AudioPlayer();

void main() {
  gameController.startNewGame(12);
  runApp(const AppRoot());
  audioPlayer.setSource(AssetSource('audio/bleep.wav'));
}



class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StartScreen()
    );
  }
}

class AppTree extends StatelessWidget {
  const AppTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Center(child: TabBarView(
          children: [
            GameScreen(),
            InfoScreen(),
            SettingsScreen()
          ],
        )),
        bottomNavigationBar: TabBar(
          labelColor: Colors.black,
          tabs: [
            Tab(icon:Icon(Icons.sports_esports, color: Colors.amber,)),
            Tab(icon:Icon(Icons.info, color: Colors.amber,)),
            Tab(icon: Icon(Icons.settings, color: Colors.amber,),)
          ],
        ),
      ),
    );
  }
}
