class Remedy{
  String name;
  String amount;
  String frequency;
  String symptom;
}

class Symptom{
  String name;
  bool selected;
  Symptom(this.name,{this.selected = false});
}