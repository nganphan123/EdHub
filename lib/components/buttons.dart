import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/themes/typography.dart';

class Button extends StatelessWidget {
  final onPressed;
  final Color color;
  final String text;
  const Button(
      {Key? key, this.onPressed, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      fixedSize: Size(300, 50),
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    );
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: buttonText,
      ),
      style: flatButtonStyle,
    );
  }
}
