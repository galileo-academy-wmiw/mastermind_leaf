import 'package:flutter/material.dart';

enum Answer {
  rightSpot,
  rightColor,
  wrong,
  empty;
}

class ScorePin extends StatelessWidget {
  const ScorePin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(
          width: 10,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
