import 'dart:math';

class CalculatorBrain{
  int weight;
  int height;
  CalculatorBrain({this.weight,this.height});

  double _bmi;
  String CalculateBmi(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String Result(){
    if (_bmi >= 25.5){
      return 'Overweight';
    } else if(_bmi >= 18.5){
      return 'Normal';
    } else{
      return 'Underweight';
    }
  }
  String getInterpretation(){
    if (_bmi >= 25.5){
      return 'You need to eat more healthy food';
    } else if(_bmi >= 18.5){
      return 'Congrads you are healthy and keep maintaining it';
    } else{
      return 'You fatso start running';
    }
  }
}