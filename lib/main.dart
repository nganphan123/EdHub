import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/profile/academic.dart';
import 'package:htn2021/profile/contact.dart';
import 'package:htn2021/profile/documents.dart';
import 'package:htn2021/profile/profile_edit.dart';
import 'package:htn2021/screens/services.dart';
import 'package:htn2021/themes/typography.dart';
import 'package:htn2021/modal.dart';
import 'package:provider/provider.dart';

import 'finalization/uploadPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModal(),
      child: MaterialApp(
        title: 'EduHub',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: mainFontFamily,
          textTheme: TextTheme(
            bodyText2: bodyText2,
            bodyText1: bodyText1,
            headline5: headline5,
            headline6: headline6,
            button: buttonText,
            subtitle1: subtitle1,
            subtitle2: subtitle2,
          ),
        ),
        home: ServiceScreen(),
        routes: <String, WidgetBuilder>{
          "/person_contact": (_) => PersonalContactPage(),
          "/academic_background": (_) => AcademicBackgroundPage(),
          "/documents": (_) => DocumentUpLoadPage(),
          "/profile_edit": (_) => ProfileEditPage(),
          "/upload_submit": (_) => UploadPage()
        },
      ),
    );
  }
}
