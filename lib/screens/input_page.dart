import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/sizeAdjustableCardContent.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selected;
  int height = 180;
  int weight = 60;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selected = Gender.male;
                        });
                      },
                      color: (selected == Gender.male)
                          ? activeColor
                          : inactiveColor,
                      cardChild: CardContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selected = Gender.female;
                        });
                      },
                      color: selected == Gender.female
                          ? activeColor
                          : inactiveColor,
                      cardChild: CardContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: activeColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Text(
                        "HEIGHT",
                        style: labelTextStyle,
                      ),
                      alignment: Alignment.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text("cm", style: labelTextStyle)
                      ],
                    ),
                    Flexible(
                        child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xFF8D8E98),
                                overlayColor: Color(0x29EB1555),
                                thumbColor: Color(0xFFEB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                            )))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: activeColor,
                      cardChild: SizeAdjustableCardContent(
                        initialMeasurement: weight,
                        labelMeasurement: 'WEIGHT',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: activeColor,
                      cardChild: SizeAdjustableCardContent(
                        initialMeasurement: age,
                        labelMeasurement: 'AGE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onPress: () {
                CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              ibmResults: calc.calculateBMI(),
                              resultText: calc.getResults(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
              buttonLabel: 'CALCULATE',
            )
          ],
        ));
  }
}
