import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class GenderCardContent extends StatelessWidget {
  final icon;
  final label;

  const GenderCardContent({
    @required this.icon,
    @required this.label,
  });


  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}