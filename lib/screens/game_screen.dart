import 'package:flutter/material.dart';

import 'package:mastermind_leaf/classes/game_row.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);
  int rowCount = 0;

  @override
  State<GameScreen> createState() => _GameScreenState();

}

class _GameScreenState extends State<GameScreen> with AutomaticKeepAliveClientMixin {
  List<GameRow> gameRows = [];

  void addRow(){
    setState(() {
      for(int i = 0; i < gameRows.length; i++){
        gameRows[i].rowActive = false;

      }
      gameRows.add(GameRow(true, addRow));
    });
    widget.rowCount = gameRows.length;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //add the first row
    if(gameRows.isEmpty){
      addRow();
    }

    //actual running stuff
    return ListView(
      children: [
        Column(
          children: gameRows
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
