import 'package:flutter/material.dart';

enum PinColor { red, yellow, green, blue, black, white, empty }

class CodePin extends StatelessWidget {
  const CodePin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(
          width: 15,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
