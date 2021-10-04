import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class CardChild extends StatelessWidget{
  final IconData icon;
  final double iconSize;
  final String text;
  //final
  CardChild({ this.icon, this.iconSize, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: kTextStyle,)
      ],
    );
  }

}