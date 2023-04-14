import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/global_variables.dart';

class CodePin extends StatefulWidget {
  CodePin(this.pinActive, this.currentColor, {super.key});

  Color currentColor;
  bool pinActive;

  VoidCallback setStateCallOnStateToDisableColorSwitching =
      () {}; //i need to call setState() once from the gamerow once to fix a bug

  @override
  State<CodePin> createState() => _CodePinState();
}

class _CodePinState extends State<CodePin> {
  List<Color> pinColors = flutterCodePinColors;

  bool colorBlindMode = true;
  bool pirateMode = true;

  int index = 0;

  Color currentColor = Colors.black;
  AssetImage currentSprite = const AssetImage('assets/images/sprites/Skull.png');


  void callSetState() {
    setState(() {});
  }

  @override
  void initState() {
    currentColor = widget.currentColor;
    if(currentColor == flutterCodePinColors[0]){
      currentSprite = sprites[0];
    }else if(currentColor == flutterCodePinColors[1]){
      currentSprite = sprites[1];
    }else if(currentColor == flutterCodePinColors[2]){
      currentSprite = sprites[2];
    }else if(currentColor == flutterCodePinColors[3]){
      currentSprite = sprites[3];
    }else if(currentColor == flutterCodePinColors[4]){
      currentSprite = sprites[4];
    }else if(currentColor == flutterCodePinColors[5]){
      currentSprite = sprites[5];
    }else if(currentColor == flutterCodePinColors[6]){
      currentSprite = sprites[6];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.setStateCallOnStateToDisableColorSwitching =
        callSetState; //makes the empty setstate available outside of CodePinState
    if(pirateMode){
      return Expanded(
        child: AbsorbPointer(
          absorbing: !widget.pinActive,
          child: ( GestureDetector(
            onTap: (){
              setState(() {
                index++;

                if (index > 6) {
                  index = 1;
                }
                currentColor = pinColors[index];
                currentSprite = sprites[index];
                widget.currentColor = currentColor;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image(
                fit: BoxFit.fill,
                image: currentSprite,
              ),
            ),
          ))
        ),
      );
    }else{
      return AbsorbPointer(
        absorbing: !widget.pinActive,
        child: GestureDetector(
          onTap: () {
            setState(() {
              index++;

              if (index > 6) {
                index = 1;
              }
              currentColor = pinColors[index];
              widget.currentColor = currentColor;
            });
          },
          /*
        DOUBLE TAP IS DISABLED BECAUSE I KEPT ACCIDENTALLY DOING IT
        onDoubleTap: () {
          setState(() {
            index--;
            if (index < 1) {
              index = 6;
            }

            currentColor = pinColors[index];
            widget.currentColor = currentColor;
          });
        },*/
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 65,
              minWidth: 30,
            ),
            child: CustomPaint(
              painter: CodePinPainter(
                  currentColor, colorBlindMode, pinColors),
              size: MediaQuery.of(context).size,
            ),
          ),
        ),
      );
    }

  }
}

class CodePinPainter extends CustomPainter {
  Color currentColor;
  bool colorBlindMode;
  List<Color> pinColors;

  CodePinPainter(
      this.currentColor, this.colorBlindMode, this.pinColors);

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);

    final paint = Paint();

    //draw outer circle
    paint.color = Colors.black;
    canvas.drawCircle(center, size.width / 2, paint);

    //draw inner circle
    paint.color = currentColor;
    canvas.drawCircle(center, (size.width / 2) * 0.80, paint);

    if (colorBlindMode) {
      paint.color = Colors.black;
      Rect rectangle = Rect.fromLTWH(0, 0, size.width, size.height);
      if (currentColor == pinColors[1]) {
        canvas.drawArc(rectangle, 0, pi / 3, true, paint);
      } else if (currentColor == pinColors[2]) {
        canvas.drawArc(rectangle, pi / 3, pi / 3, true, paint);
      } else if (currentColor == pinColors[3]) {
        canvas.drawArc(rectangle, (pi / 3) * 2, pi / 3, true, paint);
      } else if (currentColor == pinColors[4]) {
        canvas.drawArc(rectangle, pi, pi / 3, true, paint);
      } else if (currentColor == pinColors[5]) {
        canvas.drawArc(rectangle, (pi / 3) * 4, pi / 3, true, paint);
      } else if (currentColor == pinColors[6]) {
        canvas.drawArc(rectangle, (pi / 3) * 5, pi / 3, true, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
