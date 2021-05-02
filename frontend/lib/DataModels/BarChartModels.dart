import 'package:charts_flutter/flutter.dart' as charts;

import '../styles.dart';

class BarChartModel {
  String date;
  int cases;
  final charts.Color color = charts.ColorUtil.fromDartColor(blue1);

  BarChartModel({this.date, this.cases});
}