import 'package:flutter/material.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class UploadDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const UploadDialog({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          color: Color(0x00000000),
          child: Container(
            height: 300,
            width: 500,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(18.0),
              border: Border.all(color: darkBlue, width: 4.0),
            ),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  iconSize: 30,
                  icon: Icon(Icons.close),
                ),
                Center(
                  child: Column(
                    children: [
                      Spacer(flex: 2),
                      Text(
                        "Upload your file",
                        style: headline5.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(Only PDF files are accepted)",
                        style: bodyText2.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: onPressed,
                        iconSize: 100,
                        color: soDarkBlue,
                        icon: Icon(Icons.upload_file),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: onPressed,
                        style: TextButton.styleFrom(
                            backgroundColor: darkBlue,
                            primary: white,
                            textStyle: buttonText,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            )),
                        child: Text("Browse files"),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
