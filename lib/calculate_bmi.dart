import 'dart:math';
class CalculateBMI{
  CalculateBMI(this.height,this.weight);
  int height = 0;
  int weight = 0;
  double _bmi = 0;
  String operation(){
    _bmi = weight /(pow(height/100, 2));

    return _bmi.toStringAsFixed(1);
  }

  String getResult()
  {
      if(_bmi >= 25)
        {
          return "OverWeight";
        }
      else if(_bmi >= 18.5)
        {
          return "Normal";
        }else
          {
            return "Underweight";
          }
  }
  String getInterpretations()
  {
    if(_bmi >= 25)
    {
      return "Your weight is so high kindly exercise daily to build up a healthy good life style";
    }
    else if(_bmi >= 18.5)
    {
      return "Superb! you are in good Condition ! stay the same";
    }else
    {
      return "Kindly eat health get more muscle and be fit ";
    }
  }
}