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
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodyText2: bodyText2,
            )),
        home: ServiceScreen(),
        routes: <String, WidgetBuilder>{
          "/person_contact": (_) => PersonalContactPage(),
          "/academic_background": (_) => AcademicBackgroundPage(),
          "/documents": (_) => DocumentUpLoadPage(),
          "/profile_edit": (_) => ProfileEditPage(),
        },
      ),
    );
  }
}
