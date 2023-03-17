import 'package:flutter/material.dart';

import '../classes/score-pin.dart';
import '../classes/code-pin.dart';

class GameRow extends StatefulWidget {
  const GameRow({Key? key}) : super(key: key);

  @override
  State<GameRow> createState() => _GameRowState();
}

class _GameRowState extends State<GameRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CodePin(),
          CodePin(),
          CodePin(),
          CodePin(),
          TextButton(onPressed: (){}, child: Icon(Icons.forward, size: 50,)),
          Container(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ScorePin(), ScorePin()]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ScorePin(), ScorePin()]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
