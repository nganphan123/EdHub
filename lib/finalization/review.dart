import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/components/dialog.dart';
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
                      style: subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/step4.png"),
                        ),
                        Image(
                          image: AssetImage("assets/images/volcano.png"),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Click each one of these buttons to review that your info is correct and then click apply!",
                      style: subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    SectionEditButton(
                        onPressed: () {}, sectionName: "Personal Info"),
                    SizedBox(height: 20),
                    SectionEditButton(
                        onPressed: () {}, sectionName: "Academic Background"),
                    SizedBox(height: 20),
                    SectionEditButton(
                        onPressed: () {}, sectionName: "Document"),
                    SizedBox(height: 20),
                    Center(
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: white,
                            backgroundColor: mediumBlue,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          child: Text("Submit"),
                          onPressed: () => showDialog(
                              context: context,
                              builder: (_) => CongratsDialog())),
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
