import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import '../calulator_brain.dart';

class ResultsPage extends StatelessWidget {
  static const routeName = '/result';

  ResultsPage();



  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as CalculatorBrain;

    final result = routeArgs.calculateBMI();
    final resultText = routeArgs.getResult();
    final resultDesc = routeArgs.getInterpretaion();
    final weightColor = routeArgs.getWeightolor();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kActiveCardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      color: weightColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    result,
                    style: kResultNumber,
                  ),
                  Text(
                    resultDesc,
                    textAlign: TextAlign.center,
                    style: kResultDesc,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              buttonText: 'RE-CALCULATE',
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
