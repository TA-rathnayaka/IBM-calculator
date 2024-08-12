import 'package:flutter/material.dart';



class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPress;

  RoundIconButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5F),
      shape: CircleBorder(),
    );
  }
}
