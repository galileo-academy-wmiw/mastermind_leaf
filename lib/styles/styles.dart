import 'package:flutter/material.dart';

const TextStyle titleStyle = TextStyle(
  color: Colors.amber,
  fontFamily: 'Trade Winds',
  fontSize: 48
);

const TextStyle paragraphStyle = TextStyle(
  color: Colors.amber,
  fontFamily: 'Pirata One',
  fontSize: 20
);

ButtonStyle startButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber),
  foregroundColor: MaterialStateColor.resolveWith((states) => Colors.black)
);