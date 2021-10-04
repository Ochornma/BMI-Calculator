import 'dart:math';

class CalculatorBrain{

  final int height;
  final int weight;
   double _bmi;

   CalculatorBrain({this.weight, this.height});

   String calculateBMI(){
     _bmi = weight/ pow(height/100, 2);
     return _bmi.toStringAsFixed(1);
   }

   String getResult(){
     if (_bmi >= 25){
       return "Overweight";
     }else if (_bmi >= 18.5){
       return "Normal";
     }else{
       return "Underweihjt";
     }
   }

  String getInterpre(){
    if ( _bmi >= 25){
      return "Take it essy on your meal intake";
    }else if (_bmi >= 18.5){
      return "You can maintain the status quo";
    }else{
      return "Please Eat More";
    }
  }

}