import 'dart:math';

import 'package:flutter/material.dart';

import '../classes/score-pin.dart';
import '../classes/code-pin.dart';
import 'package:mastermind_leaf/main.dart';

enum PinColor {empty, red, yellow, green, blue, purple, orange}

class GameRow extends StatefulWidget {
  const GameRow({Key? key}) : super(key: key);

  @override
  State<GameRow> createState() => _GameRowState();
}

class _GameRowState extends State<GameRow> with SingleTickerProviderStateMixin {

  late Animation flyInAnimation;
  late AnimationController flyInAnimationController;

  @override
  void initState() {
    flyInAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    if(Random().nextBool()){
      flyInAnimation = Tween<double>(begin: 10, end: 0).animate(flyInAnimationController);
    }else{
      flyInAnimation = Tween<double>(begin: -10, end: 0).animate(flyInAnimationController);
    }


    flyInAnimationController.forward();

    flyInAnimation.addListener(() {
      setState(() {
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    flyInAnimationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    List<CodePin> pins = [CodePin(), CodePin(), CodePin(), CodePin()];
    Container test = Container();

    return Container(
      transform: Matrix4.translationValues(flyInAnimation.value*100, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: pins,
          ),
          TextButton(onPressed: (){


            setState(() {
              List<PinColor> inputPins = [];

              for(int i = 0; i < 4; i++){
                if(pins[i].currentColor == Colors.black){
                  inputPins.add(PinColor.empty);
                }else if(pins[i].currentColor == Colors.red){
                  inputPins.add(PinColor.red);
                }else if(pins[i].currentColor == Colors.yellow){
                  inputPins.add(PinColor.yellow);
                }else if(pins[i].currentColor == Colors.green){
                  inputPins.add(PinColor.green);
                }else if(pins[i].currentColor == Colors.blue){
                  inputPins.add(PinColor.blue);
                }else if(pins[i].currentColor == Colors.purple){
                  inputPins.add(PinColor.purple);
                }else if(pins[i].currentColor == Colors.orange){
                  inputPins.add(PinColor.orange);
                }
              }
              print(inputPins);
            });

          }, child: Icon(Icons.forward, size: 50,)),
          Container(
            constraints:const BoxConstraints(
                maxHeight: 80,
                maxWidth: 80,
                minHeight: 40,
                minWidth: 40,
            )
            ,
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
