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
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(
          width: 5,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
