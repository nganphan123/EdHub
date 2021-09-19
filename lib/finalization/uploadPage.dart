import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/finalization/uploadPage.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';
import 'package:multiselect/multiselect.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
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
                      image: AssetImage("assets/images/step3.png"),
                    ),
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: Image(
                        image: AssetImage("assets/images/star.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Down below are any additional requirements the universities/programs you chose require that you submit!",
                  textAlign: TextAlign.center,
                  style: subtitle2,
                ),
                SizedBox(height: 20),
                ...["Upload Resume and cv*", "Upload letter of intent*"]
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Uploadbuttons(
                            onTap: () {},
                            title: e,
                          ),
                        )),
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
                      onPressed: () => Navigator.pushNamed(context, "/review")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
