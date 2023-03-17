import 'package:flutter/material.dart';

enum PinColor {empty, red, yellow, green, blue, purple, orange}


class CodePin extends StatefulWidget {
  CodePin({Key? key}) : super(key: key);

  @override
  State<CodePin> createState() => _CodePinState();
}

class _CodePinState extends State<CodePin> {
  List<Color> pinColors = [Colors.black, Colors.red, Colors.yellow, Colors.green, Colors.blue, Colors.purple, Colors.orange];

  int index = 0;

  Color currentColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState((){
          index++;

          if(index >= 6){
            index = 1;
          }
          currentColor = pinColors[index];
        });
      },
      onDoubleTap: (){
        setState(() {
          index--;
          if (index <= 1){
            index = 6;
          }

          currentColor = pinColors[index];
        });
      },
      child: Container(
        width: 65,
        decoration: BoxDecoration(
          color: currentColor,
          shape: BoxShape.circle,
          border: Border.all(
            width: 5,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
