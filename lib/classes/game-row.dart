import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/global-variables.dart';
import 'package:mastermind_leaf/screens/score-screen.dart';
import '../classes/score-pin.dart';
import '../classes/code-pin.dart';
import 'package:mastermind_leaf/classes/gamecontroller.dart';
import 'package:mastermind_leaf/main.dart';


class GameRow extends StatefulWidget {
  GameRow(this.rowActive, this.addGameRowFunction, {super.key});

  List<PinColor> inputPins = [];

  bool rowActive;
  VoidCallback
      addGameRowFunction;

  @override
  State<GameRow> createState() => _GameRowState();
}

class _GameRowState extends State<GameRow> with SingleTickerProviderStateMixin {
  late Animation flyInAnimation;
  late AnimationController flyInAnimationController;

  late List<CodePin> pins;
  late List<ScorePin> scorePins;

  @override
  void initState() {
    pins = [
      CodePin(widget.rowActive, flutterCodePinColors[0]),
      CodePin(widget.rowActive, flutterCodePinColors[0]),
      CodePin(widget.rowActive, flutterCodePinColors[0]),
      CodePin(widget.rowActive, flutterCodePinColors[0])
    ];
    
    scorePins = [
      //creates 4 empty pins
      ScorePin(flutterScorePinColors[0], true),
      ScorePin(flutterScorePinColors[0], true),
      ScorePin(flutterScorePinColors[0], true),
      ScorePin(flutterScorePinColors[0], true),
    ];

    flyInAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    if (Random().nextBool()) {
      flyInAnimation =
          Tween<double>(begin: 10, end: 0).animate(flyInAnimationController);
    } else {
      flyInAnimation =
          Tween<double>(begin: -10, end: 0).animate(flyInAnimationController);
    }

    flyInAnimationController.forward();

    flyInAnimation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    flyInAnimationController.dispose();
    super.dispose();
  }



  void buttonPress() {
    if (widget.inputPins.isEmpty) {
      for (int i = 0; i < 4; i++) {
        widget.inputPins.add(flutterColorToPinColor(pins[i].currentColor));
      }
    }else{
      for(int i = 0; i < 4; i++){
        widget.inputPins[i] = flutterColorToPinColor(pins[i].currentColor);
      }
    }

    bool areThereEmptyPins = false;

    for (int i = 0; i < 4; i++) {
      if (widget.inputPins[i] == PinColor.empty) {
        areThereEmptyPins = true;
      }
    }

    print(widget.inputPins);



    if (!areThereEmptyPins) {
      //make codepins non interactive
      for (int i = 0; i < 4; i++) {
        pins[i].pinActive = false;
        pins[i].setStateCallOnStateToDisableColorSwitching();
      }

      //make scorePins the right Color
      List<PinColor> inputs = [];
      for(int i = 0; i < 4; i++){
        inputs.add(flutterColorToPinColor(pins[i].currentColor));
      }
      List<Answer> results = gameController.compareAnswer(inputs);

      for(int i = 3; i >= 0; i--){
        scorePins[i] = ScorePin(answerToFlutterColor(results[i]), true);
      }

      bool correctCombination = true;

      for(int i = 0; i <4; i++){
        if(results[i] != Answer.rightSpot){
          correctCombination = false;
        }
      }


      //if you have the correct answer
      if(correctCombination){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreScreen(true, gameScreen.rowCount, inputs)));
      }else{
        widget.rowActive = false;
        widget.addGameRowFunction();
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(flyInAnimation.value * 100, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: pins,
          ),
          AbsorbPointer(
            absorbing: !widget.rowActive,
            child: TextButton(
                onPressed: buttonPress,
                child: Icon(
                  Icons.forward,
                  size: 50,
                )),
          ),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 80,
              maxWidth: 80,
              minHeight: 40,
              minWidth: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [scorePins[0], scorePins[1]]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [scorePins[2], scorePins[3]]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
