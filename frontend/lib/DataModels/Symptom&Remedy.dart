import 'package:remedious/DataModels/GeneralUser.dart';

class Remedy{
  String name;
  String amount;
  String frequency;
  String symptom;
  int painDifference;
  int frequencyDifference;
  GeneralUser user;
  bool selected =false;

  Remedy({this.name,this.amount,this.frequency,this.symptom,this.user,this.frequencyDifference,this.painDifference});
}

class Symptom{
  String name;
  bool selected;
  Symptom(this.name,{this.selected = false});
}