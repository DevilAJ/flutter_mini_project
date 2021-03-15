import 'file:///C:/Users/ANIKET%20JAISWAL/AndroidStudioProjects/bmi-calculator-flutter-master/lib/Components/constants.dart';
import 'package:bmi_calculator/Components/constants.dart' as cmp;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/ReusableCont.dart';

class Result_page extends StatelessWidget {
  Result_page(
      {@required this.bmi,
      @required this.result,
      @required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: cmp.kAppText,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ReusableCont(
              c: cmp.kActiveCardColor,
              childWgd: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: cmp.kResultText,
                  ),
                  Text(
                    bmi,
                    style: cmp.kBMINo,
                  ),
                  Text(
                    'Normal BMI RANGE : 18.5 - 25',
                    style: cmp.kResult,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: cmp.kResult,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: cmp.kCalTextStyle,
                ),
              ),
              color: cmp.kBottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: cmp.kBottomHeight,
            ),
          ),
        ],
      ),
    );
  }
}
