import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/components/formFields.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "We're glad you are back 👋",
                  style: headline5,
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                    child:
                        Text(errorMessage, style: TextStyle(color: Colors.red)),
                  ),
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
                Align(alignment: Alignment.bottomLeft, child: Text("Password")),
                InfoField(
                  controller: passwordController,
                  validators: RequiredValidator(errorText: "Required"),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: pureBlue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Button(
                  color: mediumBlue,
                  text: "LOGIN",
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                      errorMessage = '';
                    });
                    if (_key.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      } on FirebaseAuthException catch (error) {
                        errorMessage = error.message!;
                      }
                      setState(() => isLoading = false);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Clicked the wrong button?"),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: pureBlue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
