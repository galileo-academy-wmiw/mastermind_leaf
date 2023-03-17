import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'screens/game-screen.dart';
import 'screens/info-screen.dart';
import 'screens/score-screen.dart';
import 'screens/start-screen.dart';

void main() {
  runApp(const AppRoot());
  audioPlayer.setSource(AssetSource('audio/bleep.wav'));
}

AudioPlayer audioPlayer = AudioPlayer();

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
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(child: TabBarView(
          children: [
            GameScreen(),
            InfoScreen(),
          ],
        )),
        bottomNavigationBar: TabBar(
          labelColor: Colors.black,
          tabs: [
            Tab(icon:Icon(Icons.sports_esports, color: Colors.amber,)),
            Tab(icon:Icon(Icons.info, color: Colors.amber,))
          ],
        ),
      ),
    );
  }
}
