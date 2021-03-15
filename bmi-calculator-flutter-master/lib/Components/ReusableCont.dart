import 'package:flutter/material.dart';

class ReusableCont extends StatelessWidget {
  ReusableCont({@required this.c, this.childWgd, this.onPress});
  final Color c;
  final Widget childWgd;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childWgd,
        margin: EdgeInsets.all(15),
        decoration:
            BoxDecoration(color: c, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
