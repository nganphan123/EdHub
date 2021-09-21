import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/components/formFields.dart';
import 'package:htn2021/databaseService.dart';
import 'package:htn2021/modal.dart';
import 'package:htn2021/onboarding/login.dart';
import 'package:htn2021/onboarding/welcome.dart';
import 'package:htn2021/profile/profile.dart';
import 'package:htn2021/screens/services.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final userModal = Provider.of<UserModal>(context);
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
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Form(
                key: _key,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to EDhub 👋",
                            style: headline5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "We are so glad to have you join us! Please fill out some basic info below to get started",
                            style: bodyText2,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(errorMessage,
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Username")),
                          InfoField(
                              controller: userNameController,
                              validators: MultiValidator([
                                RequiredValidator(errorText: "Requried"),
                              ])),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Email address")),
                          InfoField(
                              controller: emailController,
                              validators: MultiValidator([
                                RequiredValidator(errorText: "Requried"),
                                EmailValidator(errorText: "Invalid email")
                              ])),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Password")),
                          InfoField(
                            controller: passwordController,
                            validators:
                                RequiredValidator(errorText: "Required"),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Button(
                            color: darkBlue,
                            text: "ALL DONE",
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                                errorMessage = '';
                              });
                              if (_key.currentState!.validate()) {
                                try {
                                  UserCredential result = await FirebaseAuth
                                      .instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  User? user = result.user;
                                  String uid = user!.uid;
                                  setState(() {
                                    userModal.updateUid(uid);
                                    userModal
                                        .updateName(userNameController.text);
                                  });
                                  FirebaseFirestore.instance
                                      .collection('students')
                                      .doc(uid)
                                      .set({});
                                  userModal.fetchData();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceScreen()));
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                                setState(() => isLoading = false);
                              }
                            },
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text("Clicked the wrong button?"),
                          //     TextButton(
                          //       onPressed: () => Navigator.of(context).push(
                          //         MaterialPageRoute(
                          //             settings: RouteSettings(name: "/login"),
                          //             builder: (context) => LoginPage()),
                          //       ),
                          //       child: Text(
                          //         "Login",
                          //         style: TextStyle(
                          //             color: pureBlue,
                          //             fontWeight: FontWeight.w400),
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
