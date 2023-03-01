import 'dart:math';

import 'package:flutter/material.dart';

enum WeightStatus {
  Underweight,
  Normal,
  OverWeight,
}

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;
  WeightStatus _weightStatus; 

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25){
      _weightStatus = WeightStatus.OverWeight;
      return 'OverWeight';
    }else if (_bmi > 18.5){
      _weightStatus = WeightStatus.Normal;
      return 'Normal';
    }else {
      _weightStatus = WeightStatus.Underweight;
      return 'Underweight';
    }
  }

  String getInterpretaion() {
     if (_bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more!';
    }else if (_bmi > 18.5){
      return 'You have a normal body weight. Good job!';
    }else {
      return 'You have a lower than normal body weight. Eat a bit more!';
    }
  }

  Color getWeightolor() {
    Color color;
    if (_weightStatus == WeightStatus.Underweight){
      color = Color.fromARGB(255, 194, 181, 65);
    }else if (_weightStatus == WeightStatus.Normal){
      color = Color(0xFF24D876);
    }else {
      color = Colors.red;
    }

    return color;
  }


}