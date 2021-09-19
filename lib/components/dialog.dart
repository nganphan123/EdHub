import 'package:flutter/material.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class UploadDialog extends StatefulWidget {
  final VoidCallback onPressed;

  const UploadDialog({Key? key, required this.onPressed}) : super(key: key);

  @override
  _UploadDialogState createState() => _UploadDialogState();
}

enum UploadState {
  idle,
  loading,
  success,
  fail,
}

class _UploadDialogState extends State<UploadDialog> {
  UploadState _state = UploadState.idle;
  String fileName = "example.pdf";

  @override
  Widget build(BuildContext context) {
    Widget content = SizedBox();

    switch (_state) {
      case UploadState.idle:
        content = Column(
          children: [
            Spacer(flex: 2),
            Text(
              "Upload your file",
              style: headline5.copyWith(
                  fontWeight: FontWeight.bold, color: soDarkBlue),
            ),
            Text(
              "(Only PDF files are accepted)",
              style: bodyText2.copyWith(
                  fontSize: 12, fontWeight: FontWeight.bold, color: soDarkBlue),
            ),
            Spacer(),
            IconButton(
              onPressed: handleOnPressed,
              iconSize: 100,
              color: soDarkBlue,
              icon: Icon(Icons.upload_file),
            ),
            Spacer(),
            TextButton(
              onPressed: handleOnPressed,
              style: TextButton.styleFrom(
                  backgroundColor: darkBlue,
                  primary: white,
                  textStyle: buttonText,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )),
              child: Text("Browse files"),
            ),
            Spacer(flex: 2),
          ],
        );
        break;
      case UploadState.loading:
        content = Column(
          children: [
            Spacer(flex: 2),
            Text(
              "Loading your file",
              style: headline5.copyWith(
                  fontWeight: FontWeight.bold, color: soDarkBlue),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              child: Row(
                children: [
                  Icon(Icons.insert_drive_file, size: 40),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName,
                          style:
                              bodyText1.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        LinearProgressIndicator(
                          minHeight: 5.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                setState(() {
                  _state = UploadState.idle;
                });
              },
              style: TextButton.styleFrom(
                  backgroundColor: lightRed,
                  primary: white,
                  textStyle: buttonText,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )),
              child: Text("Cancel"),
            ),
            Spacer(flex: 2),
          ],
        );
        break;
      case UploadState.success:
        content = Column(
          children: [
            Spacer(flex: 2),
            Text(
              "Files uploaded",
              style: headline5.copyWith(
                  fontWeight: FontWeight.bold, color: soDarkBlue),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              child: Row(
                children: [
                  Icon(Icons.insert_drive_file, size: 40),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName,
                          style:
                              bodyText1.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Divider(
                          thickness: 5,
                          color: darkBlue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () => Navigator.of(context).pop<bool>(true),
              style: TextButton.styleFrom(
                backgroundColor: darkBlue,
                primary: white,
                textStyle: buttonText,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: Text("All done"),
            ),
            Spacer(flex: 2),
          ],
        );
        break;
      case UploadState.fail:
        content = Column(
          children: [
            Spacer(flex: 2),
            Text(
              "Uploading Failed",
              style: headline5.copyWith(
                fontWeight: FontWeight.bold,
                color: soDarkBlue,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: handleOnPressed,
              iconSize: 100,
              color: mediumRed,
              icon: Icon(Icons.error),
            ),
            Spacer(),
            TextButton(
              onPressed: handleOnPressed,
              style: TextButton.styleFrom(
                backgroundColor: darkBlue,
                primary: white,
                textStyle: buttonText,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: Text("Try Again"),
            ),
            Spacer(flex: 2),
          ],
        );
        break;
    }

    content = Center(
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
                  onPressed: () => Navigator.of(context).pop(false),
                  iconSize: 30,
                  icon: Icon(Icons.close),
                ),
                Center(
                  child: content,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return content;
  }

  void handleOnPressed() {
    widget.onPressed();
    setState(() {
      _state = UploadState.loading;
      Future.delayed(
        Duration(seconds: 2),
        () => setState(() {
          _state = UploadState.success;
        }),
      );
    });
  }
}
