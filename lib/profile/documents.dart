import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class DocumentUpLoadPage extends StatelessWidget {
  const DocumentUpLoadPage({Key? key}) : super(key: key);

  static const List<String> uploadTasks = [
    "Upload school transcript",
    "Upload proof of status in Canada ",
    "Upload unofficial exam results",
    "Upload credential evaluation",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          color: black,
          icon: Icon(Icons.keyboard_backspace),
        ),
      ),
      backgroundColor: white,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Image.asset("assets/images/blob_background.png"),
            left: 16.0,
            bottom: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26),
            child: ListView(
              children: [
                SizedBox(height: 15),
                Text(
                  "Documents 📝",
                  textAlign: TextAlign.center,
                  style: headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Upload all documents that are necessary for you.",
                  textAlign: TextAlign.center,
                  style: subtitle1,
                ),
                SizedBox(height: 30),
                ...uploadTasks.map(
                  (task) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Uploadbuttons(onTap: () {}, title: task),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: white,
                        textStyle: buttonText,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        backgroundColor: darkBlue,
                        padding: EdgeInsets.all(12.0),
                      ),
                      child: Text(
                        "Finished Uploading",
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
