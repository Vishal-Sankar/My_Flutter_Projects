import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/constants.dart';
class BottomButton extends StatelessWidget {
  final Function onTap;
  final String Buttontitle;
  BottomButton({@required this.onTap, @required this.Buttontitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(Buttontitle, style: kBoldTextStyle)),
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(bottom: 15),
        color: kBottomcontainercolor,
        width: double.infinity,
        height: kBottomcontainerheight,
      ),
    );
  }
}