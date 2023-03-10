import 'package:flutter/material.dart';
import 'package:mastermind_leaf/main.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: ElevatedButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AppTree())
          );
        },
      ),
    );
  }
}
