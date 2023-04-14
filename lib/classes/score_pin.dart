import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mastermind_leaf/library/global-variables.dart';

class ScorePin extends StatelessWidget {
  ScorePin(this.currentColor, this.colorBlindMode, {super.key});

  Color currentColor;
  bool colorBlindMode;

  List<Color> pinColors = flutterScorePinColors;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: CustomPaint(
          painter: ScorePinPainter(currentColor, colorBlindMode, pinColors),
          size: MediaQuery.of(context).size,

        ),
      ),
    );
  }
}

class ScorePinPainter extends CustomPainter{

  Color currentColor;
  bool colorBlindMode;
  List<Color> pinColors;

  ScorePinPainter(this.currentColor, this.colorBlindMode,this.pinColors);

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width/2, size.height/2);

    final paint = Paint();

    //draw outer circle
    paint.color = Colors.black;
    canvas.drawCircle(center, size.width/2, paint);

    //draw inner circle
    paint.color = currentColor;
    canvas.drawCircle(center, (size.width/2)* 0.75, paint);

    //draw colorblind arcs
    if(colorBlindMode){
      paint.color = Colors.black;
      Rect rectangle = Rect.fromLTWH(0, 0, size.width, size.height);
      if(currentColor == pinColors[1]){
        canvas.drawArc(rectangle, 0, (pi/3)* 2, true, paint);
      }else if(currentColor == pinColors[2]){
        canvas.drawArc(rectangle, (pi/3)*2, (pi/3)*2, true, paint);
      }else if(currentColor == pinColors[3]){
        canvas.drawArc(rectangle, (pi/3)*4, (pi/3)*2, true, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}