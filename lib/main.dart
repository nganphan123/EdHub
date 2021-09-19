import 'package:flutter/material.dart';
import 'package:htn2021/profile/academic.dart';
import 'package:htn2021/profile/contact.dart';
import 'package:htn2021/profile/documents.dart';
import 'package:htn2021/profile/profile_edit.dart';
import 'package:htn2021/screens/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ServiceScreen(),
      routes: <String, WidgetBuilder>{
        "/person_contact": (_) => PersonalContactPage(),
        "/academic_background": (_) => AcademicBackgroundPage(),
        "/documents": (_) => DocumentUpLoadPage(),
        "/profile_edit": (_) => ProfileEditPage(),
      },
    );
  }
}
