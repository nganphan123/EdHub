import 'package:flutter/material.dart';
import 'package:htn2021/components/app_note.dart';
import 'package:htn2021/themes/typography.dart';

class ApplicationsView extends StatelessWidget {
  const ApplicationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> uniList = [
      {
        "Name": "University of British Columbia",
        "Due_date": "15/01/2022",
        "Status": "Submitted",
        "Decision_date": "03/2022",
        "Logo": "assets/images/ubc_logo.png",
        "Link": "https://www.ubc.ca"
      },
      {
        "Name": "University of Toronto",
        "Status": "Submitted",
        "Due_date": "25/01/2022",
        "Decision_date": "04/2022",
        "Logo": "assets/images/uoft_logo.png",
        "Link": "https://www.utoronto.ca"
      },
      {
        "Name": "Université de Montréal",
        "Status": "Incomplete",
        "Due_date": "12/01/2022",
        "Decision_date": "03/2022",
        "Logo": "assets/images/uom_logo.png",
        "Link": "https://www.umontreal.ca/en/"
      }
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: 30),
          Text(
            "Good luck on these 🎉",
            textAlign: TextAlign.center,
            style:
                headline5.copyWith(fontSize: 29.9, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Here are all your applications.\nBest of luck!",
              textAlign: TextAlign.center,
              style: subtitle1,
            ),
          ),
          Wrap(
            spacing: MediaQuery.of(context).size.width * 0.10 - 16 * 2,
            runSpacing: MediaQuery.of(context).size.width * 0.10 - 16 * 2,
            alignment: WrapAlignment.start,
            children: uniList.map((info) => AppNote(info: info)).toList(),
          )
        ],
      ),
    );
  }
}
