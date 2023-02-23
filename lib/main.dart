import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => InputPage(),
        ResultsPage.routeName :(context) =>  ResultsPage(),
      },
    );
  }
}
