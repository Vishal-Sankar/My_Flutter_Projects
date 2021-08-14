import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/constants.dart';

class IconWidget extends StatelessWidget {
  IconWidget({@required this.gender, @required this.icon});
  final IconData icon;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '$gender',
          style: kLabeltextstyle,
        ),
      ],
    );
  }
}
