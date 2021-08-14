import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Icon_content.dart';
import 'package:bmi_calculator/components/Reuseable_card.dart';
import 'package:bmi_calculator/screens/constants.dart';
import '../components/results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = kInactivecardcolor;
  Color femalecardcolor = kInactivecardcolor;
  Gender selectedgender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseabletool(
                    colour: selectedgender == Gender.male
                        ? malecardcolor = kActivecardcolor
                        : malecardcolor = kInactivecardcolor,
                    cardChild:
                        IconWidget(icon: FontAwesomeIcons.mars, gender: 'Male'),
                    onPress: () {
                      setState(
                        () {
                          selectedgender = Gender.male;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Reuseabletool(
                    colour: selectedgender == Gender.female
                        ? kActivecardcolor
                        : kInactivecardcolor,
                    cardChild: IconWidget(
                        icon: FontAwesomeIcons.venus, gender: 'Female'),
                    onPress: () {
                      setState(
                        () {
                          selectedgender = Gender.female;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuseabletool(
              colour: kActivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabeltextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kNumbertextStyle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'cm',
                        style: kLabeltextstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseabletool(
                    colour: kActivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabeltextstyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumbertextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseabletool(
                    colour: kActivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabeltextstyle),
                        Text(
                          '$age',
                          style: kNumbertextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            Buttontitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain brain=CalculatorBrain(
                weight: weight, height: height
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(bmiresult: brain.CalculateBmi(),results: brain.Result(),interpretation: brain.getInterpretation(),),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



