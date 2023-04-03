import 'package:flutter/material.dart';

import 'package:mastermind_leaf/library/styles.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Center(
                  child: Text(
                'The Story',
                style: titleStyle,
              )),
              Text(
                  'The evil captain Seagull has taken the treasures of the noble pirate ducks. Will you help them reclaim their treasure by beating the fiendish seagull at his own game?',
                  style: paragraphStyle),
              Image(
                image: AssetImage('assets/images/rubber-duck.jpeg'),
              ),
              Center(
                  child: Text(
                'How to play',
                style: titleStyle,
              )),
              Text(
                "To beat the evil captain seagull, you have to guess the code. A code has 6 possible colors, and in the small dots to the right you will see if your guess is right.",
                style: paragraphStyle,
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.egg, color: Colors.amber,),
                          Flexible(
                            child: Text(
                              "a green spot means ye guessed the right color, and it be in the right position",
                              style: paragraphStyle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.egg, color: Colors.amber,),
                          Flexible(
                            child: Text(
                                "a yellow spot means ye guessed the right color, but be in the wrong place",
                                style: paragraphStyle),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.egg, color: Colors.amber,),
                          Flexible(
                            child: Text(
                              "and finally, a red spot means ye are just wrong",
                              style: paragraphStyle,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
