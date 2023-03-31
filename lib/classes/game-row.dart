import 'dart:math';

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    pins = [
      CodePin(widget.rowActive),
      CodePin(widget.rowActive),
      CodePin(widget.rowActive),
      CodePin(widget.rowActive)
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

      for (int i = 0; i < 4; i++) {
        pins[i].pinActive = false;
      }
      widget.rowActive = false;
      widget.addGameRowFunction();
      setState(() {});
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
