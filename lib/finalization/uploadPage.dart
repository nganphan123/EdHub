import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/finalization/review.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
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
                    onPressed: () => Navigator.of(context).pop(),
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
                      "You're one step away 😀",
                      style: headline5,
                    ),
                    Text(
                      "We are so close to done! These next two steps are really easy and simple.",
                      style: subtitle2,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/step2.png"),
                        ),
                        Image(
                          image: AssetImage("assets/images/star.png"),
                        ),
                      ],
                    ),
                    Text(
                      "Down below are any additional requirements the universities/programs you chose require that you submit!",
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
                      text: "Next step",
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewPage())),
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
