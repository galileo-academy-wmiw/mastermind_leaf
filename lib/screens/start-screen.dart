import 'package:flutter/material.dart';
import 'package:mastermind_leaf/main.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('MasterMind'),
            Container(
              child: ElevatedButton(
                child: Column(
                  children: [
                    Icon(Icons.arrow_forward),
                    Text('Start The Game')
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppTree())
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
