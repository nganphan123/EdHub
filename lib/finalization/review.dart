import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
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
                      "You did it 😀",
                      style: headline5,
                    ),
                    Text(
                      "We finally made it to the last step! This is going to be the easiest and last step so get ready.",
                      style: subtitle2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/step3.png"),
                        ),
                        Image(
                          image: AssetImage("assets/images/volcano.png"),
                        ),
                      ],
                    ),
                    Text(
                      "Click each one of these buttons to review that your info is correct and then click apply!",
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
                      text: "Apply",
                      onPressed: null,
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
