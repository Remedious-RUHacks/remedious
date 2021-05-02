import 'package:flutter/cupertino.dart';
import 'package:remedious/DataModels/Symptom&Remedy.dart';

class GeneralUser{

  String firstName;
  String lastName;
  String email;
  String password;

  int age;
  String gender;
  String ethnicBackground;
  String healthConditions;
  String medication;

  bool symptom;
  bool test;
  String testResult;

  bool treatment;
  String treatments;

  bool recovered;

  bool longTerm;
  List<Symptom> symptoms;
  int painLevel;
  int symptomLevel;

  List<Remedy> remedies;

  GeneralUser({@required this.firstName,@required this.lastName,@required this.email,@required this.password, this.age = 21,this.gender = "Male",this.ethnicBackground="Asian",this.healthConditions = "",this.medication = "",this.symptom = false,this.test=false,this.testResult="Negative"
  ,this.treatment = false,this.treatments = "",this.recovered=true,this.longTerm = false,this.symptoms= const <Symptom>[],this.painLevel = 0,this.symptomLevel = 0,this.remedies = const <Remedy>[]});
}