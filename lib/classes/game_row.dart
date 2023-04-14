import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/global-variables.dart';
import 'package:mastermind_leaf/screens/score_screen.dart';
import '../classes/score_pin.dart';
import '../classes/code_pin.dart';
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

    //build up input array
    if (widget.inputPins.isEmpty) {
      for (int i = 0; i < 4; i++) {
        widget.inputPins.add(flutterColorToPinColor(pins[i].currentColor));
      }
    }else{
      for(int i = 0; i < 4; i++){
        widget.inputPins[i] = flutterColorToPinColor(pins[i].currentColor);
      }
    }

    //check for empty pins
    bool areThereEmptyPins = false;

    for (int i = 0; i < 4; i++) {
      if (widget.inputPins[i] == PinColor.empty) {
        areThereEmptyPins = true;
      }
    }

    print(widget.inputPins);



    if (!areThereEmptyPins) {
      audioPlayer.play(AssetSource('audio/bleep.wav'));
      
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

      //set up score pins
      for(int i = 0; i < 4; i++){
        scorePins[i] = ScorePin(answerToFlutterColor(results[i]), true);
      }


      //test if the answers are correct
      bool correctCombination = true;

      for(int i = 0; i <4; i++){
        if(results[i] != Answer.rightSpot){
          correctCombination = false;
        }
      }

      //if player guessed it
      if(correctCombination){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScoreScreen(true, gameScreen.rowCount, inputs)));
      }else if(gameScreen.rowCount > gameController.turns){//if player is out of turns
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScoreScreen(false, 420, gameController.combination)));//second variable isn't used in this case so i set it as 420 because memes
      }else{//if there's still turns left and player guessed wrong
        widget.rowActive = false;
        widget.addGameRowFunction();
        setState(() {});
      }
    }else{
      audioPlayer.play(AssetSource('audio/badBleep.wav'));
    }
  }

  @override
  Widget build(BuildContext context) {
    double rowWidth = MediaQuery.of(context).size.width;
    return Container(
      transform: Matrix4.translationValues(flyInAnimation.value * 100, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: (rowWidth/6)*4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: pins,

            ),
          ),
          SizedBox(
            width: rowWidth/6,
            child: Row(
              //this row is here just to stop flutter from throwing errors
              children: [
                Expanded(
                  child: AbsorbPointer(
                    absorbing: !widget.rowActive,
                    child: GestureDetector(
                      onTap: buttonPress,
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/sprites/Arrow.png')
                        ),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: rowWidth/6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: rowWidth/12,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [scorePins[0], scorePins[1]]),
                ),
                Container(
                  height: rowWidth/12,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [scorePins[2], scorePins[3]]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
