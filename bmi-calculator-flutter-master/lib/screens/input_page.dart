import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/ReusableCont.dart';
import '../Components/Icon_cont.dart';
import '../Components/constants.dart';
import 'result_page.dart';
import '../Components/roundIconButton.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  @override
  Gender g;
  int hight = 160;
  int weight = 60;
  int age = 18;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: kAppText,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCont(
                      onPress: () {
                        setState(() {
                          g = Gender.male;
                        });
                      },
                      c: g == Gender.male
                          ? Color(0xFF1D1E33)
                          : kInactiveCardColor,
                      childWgd: Icon_cont(
                        id: FontAwesomeIcons.male,
                        s: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCont(
                      onPress: () {
                        setState(() {
                          g = Gender.female;
                        });
                      },
                      c: g == Gender.female
                          ? Color(0xFF1D1E33)
                          : kInactiveCardColor,
                      childWgd: Icon_cont(
                        id: FontAwesomeIcons.female,
                        s: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCont(
                c: kActiveCardColor,
                childWgd: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Heigth  ',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          hight.toString(),
                          style: kMaxLabelTextStyle,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Colors.tealAccent[400],
                        overlayColor: Color(0x291DE9B6),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: hight.toDouble(),
                        min: 30.0,
                        max: 300.0,
                        onChanged: (double newValue) {
                          setState(() {
                            hight = newValue.ceil();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCont(
                      c: kActiveCardColor,
                      childWgd: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            weight.toString(),
                            style: kMaxLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCont(
                      c: kActiveCardColor,
                      childWgd: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            age.toString(),
                            style: kMaxLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
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
            GestureDetector(
              onTap: () {
                if (g == Gender.female || g == Gender.male) {
                  Calculator_brain cb =
                      Calculator_brain(height: hight, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result_page(
                        bmi: cb.calculateBMI(),
                        result: cb.getBMIResult(),
                        interpretation: cb.getInterpretation(),
                      ),
                    ),
                  );
                }
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: kCalTextStyle,
                  ),
                ),
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: kBottomHeight,
              ),
            )
          ],
        ));
  }
}
