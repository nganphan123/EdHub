import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn2021/components/buttons.dart';
import 'package:htn2021/onboarding/login.dart';
import 'package:htn2021/onboarding/registration.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Image(
                  image: AssetImage("assets/images/forWelcomePage.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Easy Apply",
                style: headline5,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "EDhub simplifies the university application process all in one app. When you set up your profile, all you have to do is click a few times and your future is set!",
                style: subtitle2,
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                color: darkBlue,
                text: "Get started",
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegistrationPage())),
              ),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage())),
                child: Text(
                  "I already have an account",
                  style:
                      TextStyle(color: pureBlue, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
