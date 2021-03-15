import 'file:///C:/Users/ANIKET%20JAISWAL/AndroidStudioProjects/bmi-calculator-flutter-master/lib/Components/constants.dart';
import 'package:flutter/material.dart';

class Icon_cont extends StatelessWidget {
  Icon_cont({this.id, this.s});

  final IconData id;
  final String s;

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          id,
          size: 60,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          s,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
