import 'package:flutter/material.dart';

class CodePin extends StatefulWidget {
  CodePin({Key? key}) : super(key: key);

  @override
  State<CodePin> createState() => _CodePinState();

  Color getStateColor() {
    //THIS IS BROKEN I DONT KNOW HOW TO GET DATA OUT OF MY STATE.
    return Colors.white; //temp return type THIS IS BROKEN
  }
}

class _CodePinState extends State<CodePin> {
  List<Color> pinColors = [
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange
  ];

  int index = 0;

  Color currentColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index++;

          if (index >= 6) {
            index = 1;
          }
          currentColor = pinColors[index];
          print(currentColor);
        });
      },
      onDoubleTap: () {
        setState(() {
          index--;
          if (index <= 1) {
            index = 6;
          }

          currentColor = pinColors[index];
          print(currentColor);
        });
      },
      child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 65,
            maxWidth: 65,
            minHeight: 30,
            minWidth: 30,
          ),
          child: CustomPaint(
              painter: CodePinPainter(currentColor),
              size: MediaQuery.of(context).size,
          ),
      ),
    );
  }
}

class CodePinPainter extends CustomPainter {
  Color currentColor;
  CodePinPainter(this.currentColor);

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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
