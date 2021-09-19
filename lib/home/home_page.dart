import 'package:flutter/material.dart';
import 'package:htn2021/components/overview_tabs.dart';
import 'package:htn2021/themes/colors.dart';
import '../themes/typography.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fullName = "Jane Doe";

    List<Map<String, dynamic>> uniList = [
      {
        "Name": "University of British Columbia",
        "Status": "Submitted",
        "Logo": "assets/images/ubc_logo.png"
      },
      {
        "Name": "University of Toronto",
        "Status": "Submitted",
        "Logo": "assets/images/uoft_logo.png"
      },
      {
        "Name": "Université de Montréal",
        "Status": "Incomplete",
        "Logo": "assets/images/uom_logo.png"
      }
    ];
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ListView(
        children: [
          SizedBox(height: 30),
          Text(
            "Hey, $fullName 👋",
            textAlign: TextAlign.center,
            style:
                headline5.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Here is a summary of your application",
              textAlign: TextAlign.center,
              style: subtitle1,
            ),
          ),
          ...uniList.map(
            (info) => OverViewTab(info: info),
          ),
          Text(
            "That’s all for now...",
            textAlign: TextAlign.center,
            style: subtitle2.copyWith(color: notSoDarkGrey, fontSize: 18),
          )
        ],
      ),
    );
  }
}
