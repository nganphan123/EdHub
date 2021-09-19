import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/components/formFields.dart';
import 'package:htn2021/modal.dart';
import 'package:htn2021/onboarding/registration.dart';
import 'package:htn2021/onboarding/welcome.dart';
import 'package:htn2021/profile/profile.dart';
import 'package:htn2021/screens/services.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';
import 'package:provider/provider.dart';

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
                    onPressed: () => Navigator.of(context).pop(),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "We're glad you are back 👋",
                        style: headline5,
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
                        color: darkBlue,
                        text: "LOGIN",
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                            errorMessage = '';
                          });
                          if (_key.currentState!.validate()) {
                            try {
                              UserCredential result = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              User? user = result.user;
                              userModal.updateUid(user!.uid);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ServiceScreen()));
                              print(user.uid);
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
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()),
                            ),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: pureBlue, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
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
