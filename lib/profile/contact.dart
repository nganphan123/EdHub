import 'package:flutter/material.dart';
import 'package:htn2021/components/text_fields.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class PersonalContactPage extends StatefulWidget {
  const PersonalContactPage({Key? key}) : super(key: key);

  @override
  _PersonalContactPageState createState() => _PersonalContactPageState();
}

class _PersonalContactPageState extends State<PersonalContactPage> {
  final Map<String, TextEditingController> hintTextsToController = {
    "Legal Name*": TextEditingController(),
    "Preferred Name": TextEditingController(),
    "Date of birth (dd/mm/yy)*": TextEditingController(),
    "Canadian Indigenous status": TextEditingController(),
    "Citizenship status*": TextEditingController(),
    "First Language*": TextEditingController(),
    "Preferred Language*": TextEditingController(),
    "Have your parents attend university/college?*": TextEditingController(),
    "Home address*": TextEditingController(),
    "Mailing address (if different from home)": TextEditingController(),
    "Phone Number*": TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Text(
                "Personal contact info 😀",
                textAlign: TextAlign.center,
                style: headline5.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Below fill out your personal info. Don’t worry all this data goes solely to the universities that you apply to.",
              textAlign: TextAlign.center,
              style: subtitle1,
            ),
            SizedBox(height: 30),
            ...hintTextsToController.keys
                .map((hintText) => CustomTextField(
                    hintText: hintText,
                    controller: hintTextsToController[hintText]!))
                .toList(),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          "Are you all done?\nClick the button below ⬇️",
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              minimumSize: const Size.fromHeight(35),
                              primary: white,
                              backgroundColor: mediumBlue,
                            ),
                            onPressed: () => {Navigator.of(context).pop()},
                            child: Text("All Done"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: white,
                  backgroundImage:
                      AssetImage('assets/images/thinking_emoji.png'),
                ),
              ],
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
