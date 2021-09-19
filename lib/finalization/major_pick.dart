import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/finalization/uploadPage.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class MajorPickPage extends StatefulWidget {
  const MajorPickPage({Key? key}) : super(key: key);

  @override
  _MajorPickPageState createState() => _MajorPickPageState();
}

class _MajorPickPageState extends State<MajorPickPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 30),
                  child: IconButton(
                    onPressed: null,
                    // () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Halfway there 😀",
                      style: headline5,
                    ),
                    Text(
                      "You got this no need to worry! You're halfway done already.",
                      style: subtitle2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/step1.png"),
                        ),
                        Image(
                          image: AssetImage("assets/images/bulb.png"),
                        ),
                      ],
                    ),
                    Text(
                      "Select your top 3 programs you want to apply to by clicking each one in order from 1 (top pick) to 3 (last pick).",
                      style: subtitle2,
                    ),
                    Button(
                      color: darkBlue,
                      text: "FirstPick",
                      onPressed: null,
                    ),
                    Button(
                      color: darkBlue,
                      text: "FirstPick",
                      onPressed: null,
                    ),
                    Button(
                      color: darkBlue,
                      text: "FirstPick",
                      onPressed: null,
                    ),
                    Button(
                      color: darkBlue,
                      text: "Next step",
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadPage())),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
