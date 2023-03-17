
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mastermind_leaf/main.dart';
import 'package:mastermind_leaf/styles/styles.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                 child: Text('MasterMind', style: titleStyle,)
              ),
              const Image(
                image: AssetImage('assets/images/seagull.jpg'),
              ),
              ElevatedButton(
                style: startButtonStyle,
                child: Column(
                  children: const [
                    Icon(Icons.arrow_forward),
                    Text('Start The Game')
                  ],
                ),
                onPressed: () {
                  audioPlayer.play(AssetSource('audio/bleep.wav'));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppTree())
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
