import 'package:flutter/material.dart';
import '../themes/colors.dart';
import '../themes/typography.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double verticalMargin;
  final TextEditingController controller;
  final bool shouldCenter;
  const CustomTextField({
    Key? key,
    this.shouldCenter = false,
    required this.hintText,
    required this.controller,
    this.verticalMargin = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalMargin),
      child: TextField(
        cursorColor: black,
        controller: controller,
        textAlign: shouldCenter ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: bodyText2.copyWith(color: darkGrey),
          fillColor: lightGrey,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: mediumGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: mediumGrey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: mediumRed),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: mediumGrey),
          ),
        ),
      ),
    );
  }
}
