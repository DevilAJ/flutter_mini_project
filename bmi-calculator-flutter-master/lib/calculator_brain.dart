import 'dart:math';

class Calculator_brain {
  Calculator_brain({this.height, this.weight});

  final height;
  final weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getBMIResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi >= 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return 'You have a higher than normal body weight. Try to exercise more.';
    else if (_bmi >= 18.5)
      return 'You are totally fit.\nGood job!!';
    else
      return 'You have a lower then normal body weight. Try to eat more.';
  }
}
