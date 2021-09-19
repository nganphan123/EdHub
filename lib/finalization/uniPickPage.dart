import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/finalization/uploadPage.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';
import 'package:multiselect/multiselect.dart';

class UniPickPage extends StatefulWidget {
  const UniPickPage({Key? key}) : super(key: key);

  @override
  _UniPickPageState createState() => _UniPickPageState();
}

class _UniPickPageState extends State<UniPickPage> {
  final List<String> uniList = [
    "University of British Columbia",
    "University of Toronto",
    "Université de Montréal",
  ];

  List<String> selectedSchools = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ListView(
          children: [
            SizedBox(height: 80),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Application time 😀",
                  style: headline5.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Text(
                    "Let’s make this easy and simple! It’s a 4 step process and you don’t need to do much at all.",
                    textAlign: TextAlign.center,
                    style: subtitle1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage("assets/images/step1.png"),
                    ),
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: Image(
                        image: AssetImage("assets/images/thumb_up.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Select universities from the dropdown list that you want to apply to.",
                  style: subtitle2,
                ),
                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints.loose(
                    Size(double.infinity, 85),
                  ),
                  child: Center(
                    child: DropDownMultiSelect(
                      onChanged: (list) {
                        setState(() {
                          selectedSchools = list;
                        });
                      },
                      options: uniList,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: mediumGrey),
                        ),
                      ),
                      selectedValues: selectedSchools,
                      whenEmpty: 'Select a school',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: white,
                        backgroundColor: mediumBlue,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text("Next Step"),
                      onPressed: () =>
                          Navigator.pushNamed(context, "/upload_submit")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
