import 'package:flutter/material.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class UnSupportedView extends StatelessWidget {
  const UnSupportedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: white,
      child: Center(
        child: Text(
          "Coming Soon",
          style: headline6,
        ),
      ),
    );
  }
}
