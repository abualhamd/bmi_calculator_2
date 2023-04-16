import '../app/utils/enums/enums.dart';

class BMIModel {
  Gender? _gender;
  int _height = 180;
  int _weight = 78;
  int _age = 20;

  BMIModel._internal();
  static BMIModel _instance = BMIModel._internal();
  factory BMIModel(){
    return _instance;
  }

  Gender? get gender => _gender;
  int get height => _height;
  int get weight => _weight;
  int get age => _age;

  void setGender(Gender gender) => _gender = gender;
  void setHeight(int height) => _height = height;
  void incWeight() => _weight++;
  void decWeight() => _weight--;
  void incAge() => _age++;
  void decAge() => _age--;
}
