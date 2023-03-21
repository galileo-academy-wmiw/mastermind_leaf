import 'package:flutter/material.dart';

import '../classes/score-pin.dart';
import '../classes/code-pin.dart';
import 'package:mastermind_leaf/classes/game-row.dart';
import 'package:mastermind_leaf/screens/score-screen.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            GameRow()
          ],
        ),
        ElevatedButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreScreen()));
            },
            child: Text('to score screen')
        ),
      ],
    );
  }
}
