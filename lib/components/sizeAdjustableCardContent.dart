import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SizeAdjustableCardContent extends StatefulWidget {
  final int initialMeasurement;
  final String labelMeasurement;

  SizeAdjustableCardContent({
    required this.initialMeasurement,
    required this.labelMeasurement,
  });

  @override
  _SizeAdjustableCardContentState createState() =>
      _SizeAdjustableCardContentState();
}

class _SizeAdjustableCardContentState extends State<SizeAdjustableCardContent> {
  late int measurement;

  @override
  void initState() {
    super.initState();
    measurement = widget.initialMeasurement;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.labelMeasurement,
          style: labelTextStyle,
        ),
        Text(
          measurement.toString(),
          style: kNumberTextStyle,
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPress: () {
                  setState(() {
                    measurement++;
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPress: () {
                  setState(() {
                    measurement--;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
