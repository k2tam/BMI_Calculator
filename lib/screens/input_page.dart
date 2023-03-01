import 'package:bmi_calculator/calulator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/reuseable_card.dart';
import '../widgets/gender_card_content.dart';
import '../constants.dart';
import 'result_page.dart';
import '../widgets/rounded_button.dart';
import '../widgets/bottom_button.dart';

enum Gender {
  male,
  female,
}

enum Operator {
  add,
  minus,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 165;
  int weight = 55;
  int age = 17;

  void genderHandler(Gender gender) {
    setState(() {
      gender == Gender.male
          ? selectedGender = Gender.male
          : selectedGender = Gender.female;
    });
  }

  void weightHander(Operator operator) {
    if (operator == Operator.add && weight <= 635) {
      setState(() {
         weight++;
      });
    }else if(weight != 1){
      setState(() {
        weight --;
      });
    }else{
      return;
    }
  }

  void ageHander(Operator operator) {
    if (operator == Operator.add){
      setState(() {
        age ++;
      });
    }else if (age !=0){
      setState(() {
        age --;
      });
      
    }else {
      return;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () => genderHandler(Gender.male),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () => genderHandler(Gender.female),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ReuseableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: kLabelNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.roundToDouble();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kLabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                weightHander(Operator.minus);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                weightHander(Operator.add);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kLabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                ageHander(Operator.minus);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                ageHander(Operator.add);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
                buttonText: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(
                      height: height.toInt(), weight: weight.toInt());
                  Navigator.pushNamed(context, ResultsPage.routeName,
                      arguments: calc);
                }),
          ),
        ],
      ),
    );
  }
}
