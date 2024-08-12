import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {required this.ibmResults,
      required this.resultText,
      required this.interpretation});

  final String ibmResults;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Results', style: kTitleTextStyle),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                color: activeColor,
                cardChild: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: kResultTextStyle,
                      ),
                      SizedBox(height: 10.0), // Adjusted size for spacing
                      Text(
                        ibmResults,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      BottomButton(
                        onPress: () {
                          Navigator.pop(context);
                        },
                        buttonLabel: 'RE-CALCULATE',
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
