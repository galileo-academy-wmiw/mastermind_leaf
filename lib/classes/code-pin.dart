import 'package:flutter/material.dart';

class CodePin extends StatefulWidget {
  CodePin({Key? key}) : super(key: key);


  @override
  State<CodePin> createState() => _CodePinState();


  Color getStateColor(){
    //THIS IS BROKEN I DONT KNOW HOW TO GET DATA OUT OF MY STATE.
    return Colors.white;//temp return type THIS IS BROKEN
  }

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
          print(currentColor);
        });
      },
      onDoubleTap: (){
        setState(() {
          index--;
          if (index <= 1){
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
        child: Container(
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
      ),
    );
  }
}
