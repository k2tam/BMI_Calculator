import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const RoundIconButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 54,
        height: 54,
      ),
      shape: const CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onTap,
    );
  }
}