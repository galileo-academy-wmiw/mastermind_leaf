import 'package:flutter/material.dart';
import 'screens/game-screen.dart';
import 'screens/info-screen.dart';
import 'screens/score-screen.dart';
import 'screens/start-screen.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        body: Center(child: AppTree()),
        appBar: AppBar(title:Text("Mastermind")),
      ),
    );
  }
}

class AppTree extends StatelessWidget {
  const AppTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameScreen();
  }
}
