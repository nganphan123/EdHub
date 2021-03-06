import 'package:flutter/material.dart';
import 'package:htn2021/modal.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';
import 'package:provider/provider.dart';
import '../components/buttons.dart';

class ProfileView extends StatelessWidget {
  /// The types of students.
  /// Currently, we are supporting Domestics & International students.
  static const List<String> studentTypes = ["Domestics", "International"];

  /// The sections of a profile that is edittable.
  static const List<String> sections = [
    "Personal/Contact Information",
    "Academic Background",
    "Documents",
  ];

  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userModal = Provider.of<UserModal>(context);
    String fullName = userModal.getName();
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // CircleAvatar(
                  //   radius: 70,
                  //   backgroundColor: lightBlue,
                  //   foregroundImage:
                  //       AssetImage("assets/images/profile_emoji.png"),
                  // ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBlue,
                    ),
                    child: Image.asset(
                      "assets/images/profile_emoji.png",
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    tooltip: "Edit avatar",
                    color: darkBlue,
                    icon: Icon(Icons.add_a_photo),
                  )
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text(
                      fullName,
                      style: headline5.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ProfileEditButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/profile_edit"),
                      title: "Edit Profile",
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(flex: 1),
          SectionEditButton(
            onPressed: () => Navigator.of(context).pushNamed("/person_contact"),
            sectionName: sections[0],
          ),
          SizedBox(height: 25),
          SectionEditButton(
            onPressed: () =>
                Navigator.of(context).pushNamed("/academic_background"),
            sectionName: sections[1],
          ),
          SizedBox(height: 25),
          SectionEditButton(
            onPressed: () => Navigator.of(context).pushNamed("/documents"),
            sectionName: sections[2],
          ),
          SizedBox(height: 35),
          DetailToggleButtons(
            choices: studentTypes,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
