import 'package:flutter/material.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';
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
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: lightBlue,
                  ),
                  IconButton(
                    onPressed: () {},
                    tooltip: "Edit avatar",
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
                      "Jane Doe",
                      style: headline5.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ProfileEditButton(
                      onPressed: () {},
                      title: "Edit Profile",
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(flex: 1),
          SectionEditButton(
            onPressed: () {},
            sectionName: sections[0],
          ),
          SizedBox(height: 25),
          SectionEditButton(
            onPressed: () {},
            sectionName: sections[1],
          ),
          SizedBox(height: 25),
          SectionEditButton(
            onPressed: () {},
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
