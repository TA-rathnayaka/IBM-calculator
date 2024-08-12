import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton({ required this.onPress, required String this.buttonLabel});

  final void Function() onPress;
  String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(child:Text(buttonLabel, style: kLargeButtonStyle,)),
        color: bottomContainer,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
