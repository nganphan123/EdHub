import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:htn2021/themes/colors.dart';

class InfoField extends StatelessWidget {
  final TextEditingController controller;
  final FieldValidator validators;
  const InfoField(
      {Key? key, required this.controller, required this.validators})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: mediumGrey),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          focusColor: black,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        validator: validators,
      ),
    );
  }
}
