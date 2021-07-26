import 'package:flutter/material.dart';

class CardStyle {
  CardStyle._();
  static TextStyle? cardHeadingStyle = TextStyle(
    fontSize: 20,
    color: Colors.black54,
  );
  static TextStyle? answerTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
  static TextStyle? generatedPassword = TextStyle(
    fontSize: 18,
  );
  static Widget copyIcon = Icon(
    Icons.copy,
    size: 20,
    color: Colors.black,
  );
}
