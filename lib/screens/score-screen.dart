import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/styles.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("you've taken 420 turns", style: paragraphStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
