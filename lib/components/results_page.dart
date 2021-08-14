import 'package:bmi_calculator/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bmi_calculator/components/Reuseable_card.dart';
import 'package:bmi_calculator/screens/constants.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  final String bmiresult;
  final String results;
  final String interpretation;
  ResultPage({@required this.bmiresult,@required this.results,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Center(
                child: Text('Your Result', style: kLargeTextStyle),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Reuseabletool(
              colour: kActivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$results'.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    '$bmiresult',
                    style: kBMITextStyle,
                  ),
                  Text('$interpretation',
                      style: kBodyTextStyle, textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              Buttontitle: 'RE-CALUCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
