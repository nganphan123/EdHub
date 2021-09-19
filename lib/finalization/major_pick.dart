import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/finalization/uploadPage.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';
import 'package:multiselect/multiselect.dart';

class MajorPickPage extends StatefulWidget {
  const MajorPickPage({Key? key}) : super(key: key);

  @override
  _MajorPickPageState createState() => _MajorPickPageState();
}

class _MajorPickPageState extends State<MajorPickPage> {
  final List<String> uniList = [
    "Computer Science",
    "Mathematics",
    "Graphic Designs",
    "Political Science"
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
                  "Halfway there 😀",
                  style: headline5.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Text(
                    "You got this no need to worry! You’re halfway done already.",
                    textAlign: TextAlign.center,
                    style: subtitle1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage("assets/images/step2.png"),
                    ),
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: Image(
                        image: AssetImage("assets/images/bulb.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Select your top 3 programs you want to apply to by clicking each one in order from 1 (top pick) to 3 (last pick).",
                  textAlign: TextAlign.center,
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
                      whenEmpty: 'Select a major',
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
