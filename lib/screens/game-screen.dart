import 'package:flutter/material.dart';

import '../classes/score-pin.dart';
import '../classes/code-pin.dart';
import 'package:mastermind_leaf/classes/game-row.dart';
import 'package:mastermind_leaf/screens/score-screen.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();

}

class _GameScreenState extends State<GameScreen> {
  List<GameRow> gameRows = [];

  void addRow(){
    setState(() {
      for(int i = 0; i < gameRows.length; i++){
        gameRows[i].rowActive = false;

      }
      gameRows.add(GameRow(true, addRow));
    });

  }

  @override
  Widget build(BuildContext context) {
    //add the first row
    if(gameRows.length == 0){
      addRow();
    }

    //actual running stuff
    return ListView(
      children: [
        Column(
          children: gameRows
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
