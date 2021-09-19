import 'package:flutter/material.dart';
import 'package:htn2021/themes/colors.dart';
import 'package:htn2021/themes/typography.dart';
import 'package:url_launcher/url_launcher.dart';

class AppNote extends StatelessWidget {
  final Map<String, dynamic> info;
  const AppNote({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.width * 0.70,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/sticky_note.png",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  (info["Status"] as String).toUpperCase(),
                  style: subtitle1.copyWith(fontWeight: FontWeight.bold),
                ),
                Text("${info["Name"]}", style: subtitle1),
                Text(
                  "🕒 Due date: ${info["Due_date"]}",
                ),
                Text("🕒 Decision month: ${info["Decision_date"]}"),
                Text(
                  "To view university website\nclick the logo",
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () => launch(info["Link"]),
                  child: Container(
                    height: 45,
                    width: 45,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                    ),
                    child: Image.asset(
                      info["Logo"],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
