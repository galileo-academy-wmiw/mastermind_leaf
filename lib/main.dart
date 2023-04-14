import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:mastermind_leaf/classes/gamecontroller.dart';
import 'package:mastermind_leaf/library/global_variables.dart';
import 'package:mastermind_leaf/library/setting_functions.dart';
import 'package:mastermind_leaf/screens/game_screen.dart';
import 'package:mastermind_leaf/screens/info_screen.dart';
import 'package:mastermind_leaf/screens/start_screen.dart';
import 'package:mastermind_leaf/screens/settings_screen.dart';

GameController gameController = GameController();
GameScreen gameScreen = GameScreen();
AudioPlayer audioPlayer = AudioPlayer();

setSoundEnabled() async{
  soundEnabled = await loadSettingsBool('settingSoundEnabled', true);
}

void main() {
  setSoundEnabled();
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
            gameScreen,
            const InfoScreen(),
            const SettingsScreen()
          ],
        )),
        bottomNavigationBar: const TabBar(
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
