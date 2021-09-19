import 'package:flutter/material.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class OverViewTab extends StatelessWidget {
  final Map<String, dynamic> info;
  const OverViewTab({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        tileColor: lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        subtitle: Text(
          "Status = ${info["Status"]}",
          style: subtitle1,
        ),
        leading: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: white,
          ),
          child: Image.asset(info["Logo"]),
        ),
        title: Text(info["Name"]),
      ),
    );
  }
}
