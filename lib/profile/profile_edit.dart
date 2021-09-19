import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/components/text_fields.dart';
import '../themes/typography.dart';
import '../themes/colors.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final Map<String, TextEditingController> hintTextsToController = {
    "Edit your name": TextEditingController(),
    "Add your pronouns": TextEditingController(),
  };

  final List<String> actions = [
    "Finalize Edits",
    "Log out",
  ];

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
              padding: const EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                "Your custom profile",
                textAlign: TextAlign.center,
                style: headline5.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBlue,
                    ),
                    child: Image.asset(
                      "assets/images/profile_emoji.png",
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: darkBlue,
                    icon: Icon(Icons.add_a_photo),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ...hintTextsToController.keys.map(
              (hintText) => CustomTextField(
                hintText: hintText,
                shouldCenter: true,
                controller: hintTextsToController[hintText]!,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            DetailToggleButtons(
              choices: actions,
              colors: [lightGreen, lightRed],
              callbacks: [
                () {
                  print("Finalize Edits");
                },
                () {
                  print("Log out");
                }
              ],
            ),
          ],
        ),
      ),
    );
  }
}
