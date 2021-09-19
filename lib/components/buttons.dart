import 'package:flutter/material.dart';
import '../themes/colors.dart';
import '../themes/typography.dart';

/// The long button to start an edition page for a profile section.
class SectionEditButton extends StatelessWidget {
  /// The callback to define the action when the button is pressed.
  final VoidCallback onPressed;

  /// The name of the section to edit.
  final String sectionName;

  /// Create a default-styled button for an edittable profile section.
  const SectionEditButton({
    Key? key,
    required this.onPressed,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: mediumGrey),
        ),
        minimumSize: const Size.fromHeight(50.0),
        backgroundColor: lightGrey,
        primary: darkGrey,
      ),
      child: Text(sectionName, style: bodyText1),
    );
  }
}

class ProfileEditButton extends StatelessWidget {
  /// The callback to define the action when the button is pressed.
  final VoidCallback onPressed;

  /// The name of the section to edit.
  final String title;
  const ProfileEditButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        minimumSize: const Size.fromHeight(30.0),
        backgroundColor: darkBlue,
        primary: black,
      ),
      child: Text(title),
    );
  }
}

class DetailToggleButtons extends StatefulWidget {
  /// The set of choices
  final List<String> choices;

  /// Create a default-style toggle buttons.
  const DetailToggleButtons({Key? key, required this.choices})
      : assert(choices.length > 0),
        super(key: key);

  @override
  _DetailToggleButtonsState createState() => _DetailToggleButtonsState();
}

class _DetailToggleButtonsState extends State<DetailToggleButtons> {
  /// A list of bool(s) to specify which button is being selected.
  /// Only one button can be selected at a time.
  late final List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(widget.choices.length, (index) => false);
    _isSelected[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List.generate(
      widget.choices.length,
      (index) => Expanded(
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            minimumSize: const Size.fromHeight(60.0),
            primary: black,
            backgroundColor: _isSelected[index] ? darkGreen : lightGreen,
          ),
          onPressed: () {
            setState(() {
              for (int i = 0; i < widget.choices.length; i++) {
                _isSelected[i] = i == index;
              }
            });
          },
          child: Text(
            widget.choices[index],
            style: buttonText,
          ),
        ),
      ),
    );
    // Add space in between
    children.insert(1, SizedBox(width: 16.0));

    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}