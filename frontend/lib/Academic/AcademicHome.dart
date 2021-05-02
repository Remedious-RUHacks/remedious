import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:remedious/DataModels/BarChartModels.dart';
import 'package:remedious/DataModels/GeneralUser.dart';
import 'package:remedious/styles.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import '../CommonWidgetMaker.dart';

// ignore: must_be_immutable
class AcademicHome extends StatefulWidget {

  @override
  _AcademicHomeState createState() => _AcademicHomeState();
}

class _AcademicHomeState extends State<AcademicHome> {

  GeneralUser user;

  TextEditingController searchController = TextEditingController();

  Widget barGraph = Container();
  Widget pieChart;

  List<Color> defaultColorList = [
    Color(0xFF034c81),
    Color(0xFF2ca3fa),
    Color(0xFF5ba2f4),
    Color(0xFF7f85fc),
    Color(0xFFc9bbaa),
    Color(0xFFffffff),
    blue1
  ];
  List<String> symptoms = [
    "High Temperature",
    "Diarrhoea",
    "Heart Palpitations",
    "Extreme Tiredness",
    "Joint pain",
    "Loss of taste",
    "Chest Pain",
  ];


  String selectedSymptom = "High Temperature";
  
  ScrollController controller1 = ScrollController();
  @override
  void initState(){
    super.initState();
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    user = ModalRoute.of(context).settings.arguments;
    barGraph = Container(
      height: MediaQuery.of(context).size.height*0.7,
      width:  MediaQuery.of(context).size.width*0.8,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
    pieChart = Container(
      height: MediaQuery.of(context).size.height*0.7,
      width:  MediaQuery.of(context).size.width*0.8,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );

    Future.delayed(Duration.zero, (){
      makeBarChart(selectedSymptom);
      makePieChart();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body:Container(
        color: bgColor,
        child: SmoothScrollWeb(
          controller: controller1,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller1,
            child: Column(
              children: <Widget>[
              Container(
              height:60,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Stack(
                children: [
                  Row(
                    children: <Widget>[
                      SizedBox(width:30),
                      Image(
                        image: AssetImage('images/Logo.png'),
                      ),
                      SizedBox(width:30),
                      Text("Home",style: TextStyle(
                          color: blue1,
                          fontSize: 14
                      ),),
                      SizedBox(width:30),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, academicDatabaseRoute,arguments:user);
                        },
                        child: Text("Database",style: TextStyle(
                            color: Colors.white,
                            fontSize: 14
                        ),),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Icon(Icons.notifications,color:blue1),

                      ),
                      SizedBox(width: 20,),
                      Center(
                        child: Container(
                          height: 45,
                          constraints: BoxConstraints(
                              minWidth: 150
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: blue1,width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width:20),
                              Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: blue1),
                                  ),
                                  child: Icon(Icons.person,color:blue1,size: 25,)
                              ),
                              SizedBox(width: 20,),
                              Text(user.firstName,style: TextStyle(
                                  color: blue1,
                                  fontSize: 14
                              ),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30,)
                    ],
                  )
                ],
              ),
            ),
                SizedBox(height: 60,),
                Container(
                  height:50,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                      color:blue1,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/Dashboard.webp"),
                      ),
                      SizedBox(width: 10,),
                      Text("Dashboard",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 58,
                  width: 450,
                  decoration: BoxDecoration(
                      color: grey2,
                      borderRadius: BorderRadius.circular(29),
                      border: Border.all(color: grey3,width: 2)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                      child: TextFormField(
                        controller: searchController,
                        style: TextStyle(color:grey3,fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            child: Icon(
                              Icons.search,
                              color: grey3,
                            ),
                          ),
                          hintText: 'Search symptoms or remedies',
                          hintStyle: TextStyle(color:grey3,fontSize: 14),
                          border:null,
                          enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                              color: Color.fromRGBO(0,0,0,0)
                          )),
                          focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                              color: Color.fromRGBO(0,0,0,0)
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: barGraph,
                        )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.7+2,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: Column(
                        children: symptoms.map((e) {
                          return InkWell(
                            onTap: (){
                              selectedSymptom = e;
                              setState(() {

                              });
                              makeBarChart(e);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              width: 150,
                              decoration: BoxDecoration(
                                color: selectedSymptom==e?blue1: grey2,
                              ),
                              child: Center(
                                child: Text(e,style: TextStyle(
                                  color:selectedSymptom==e?Colors.black:Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),textAlign: TextAlign.center,),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                SizedBox(height:30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height:10),
                            Text("Last 15 days",
                                style: TextStyle(
                                    color: blue1, fontSize: 22,
                                    fontWeight: FontWeight.bold)
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: pieChart,
                            ),
                          ],
                        )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.7,
                      width: 150,
                      child:Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: symptoms
                              .map(
                                (item) => Legend(
                              title: item,
                              color: getColor(
                                defaultColorList,
                                symptoms.indexOf(item),
                              ),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white,
                                  fontSize: 16
                              ),
                              legendShape: BoxShape.rectangle,
                            ),
                          )
                              .toList(),
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(height:30),
                bottomBar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void makeBarChart(String disease) async {
    barGraph = Container(
      height: MediaQuery.of(context).size.height*0.7,
      width:  MediaQuery.of(context).size.width*0.8,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
    setState(() {

    });
    Random random = Random();
    List<BarChartModel> _barChartList = <BarChartModel>[
      BarChartModel(
        date: "01-05-2021",
        cases: random.nextInt(500)+100,
      ),
      BarChartModel(
        date: "30-04-2021",
        cases: random.nextInt(300)+50,
      ),
      BarChartModel(
        date: "29-04-2021",
        cases: random.nextInt(400)+80,
      ),
      BarChartModel(
        date: "28-04-2021",
        cases: random.nextInt(100)+100,
      ),
      BarChartModel(
        date: "27-04-2021",
        cases: random.nextInt(150),
      ),
      BarChartModel(
        date: "26-04-2021",
        cases: random.nextInt(500)+100,
      ),
      BarChartModel(
        date: "25-04-2021",
        cases: random.nextInt(200)+100,
      ),
      BarChartModel(
        date: "24-04-2021",
        cases: 34,
      ),
      BarChartModel(
        date: "23-04-2021",
        cases: random.nextInt(500),
      ),
      BarChartModel(
        date: "22-04-2021",
        cases: random.nextInt(100)+100,
      ),
      BarChartModel(
        date: "21-04-2021",
        cases: random.nextInt(50)+30,
      ),
      BarChartModel(
        date: "20-04-2021",
        cases: random.nextInt(50),
      ),
      BarChartModel(
        date: "19-04-2021",
        cases: random.nextInt(300)+100,
      ),
      BarChartModel(
        date: "18-04-2021",
        cases: random.nextInt(500)+100,
      ),
      BarChartModel(
        date: "17-04-2021",
        cases: random.nextInt(200)+100,
      ),
    ].reversed.toList();
    int totalCases = 0;
    for (BarChartModel i in _barChartList){
      totalCases += i.cases;
    }
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
          id: disease,
          data: _barChartList,
          domainFn: (BarChartModel series, _) => series.date,
          measureFn: (BarChartModel series, _) => series.cases,
          colorFn: (BarChartModel series, _) => series.color),
    ];
    Future.delayed(Duration(seconds: 1,milliseconds: 500),(){
      barGraph = Container(
        height: MediaQuery.of(context).size.height*0.7,
        width: MediaQuery.of(context).size.width*0.8,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(disease,
                        style: TextStyle(
                            color: blue1, fontSize: 22,
                            fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 40,),
                    Text("Last 15 days",style: TextStyle(
                        color: blue1, fontSize: 18,
                        fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(totalCases.toString(),
                        style: TextStyle(
                            color: blue1, fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                    SizedBox(width:40),
                  ],
                ),
              ],
            ),
            Expanded( child: charts.BarChart(series,
                animate: true)
            ),
          ],
        ),
      );
      setState(() {

      });
    });

  }

  void makePieChart() async {
    Map<String,double> symptoms2 = {
      "High Temperature":456,
      "Diarrhoea":567,
      "Heart Palpitations":674,
      "Extreme Tiredness":932,
      "Joint pain":543,
      "Loss of taste":365,
      "Chest Pain":606,
    };
    await Future.delayed(Duration(seconds:1,milliseconds: 500));
    pieChart = Container(
      height: MediaQuery.of(context).size.height*0.7,
      width: MediaQuery.of(context).size.width*0.8,
      child: PieChart(
        dataMap: symptoms2,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        // colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        colorList: defaultColorList,
        ringStrokeWidth: 32,
        legendOptions: LegendOptions(
        //   showLegendsInRow: false,
        //   legendPosition: LegendPosition.right,
          showLegends: false,
        //   legendShape: BoxShape.rectangle,
        //   legendTextStyle: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     color:Colors.white,
        //     fontSize: 18
        //   ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: false,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      ),
    );
    setState((){});
  }
}

class Legend extends StatelessWidget {
  Legend({
    @required this.title,
    @required this.color,
    @required this.style,
    @required this.legendShape,
  });

  final String title;
  final Color color;
  final TextStyle style;
  final BoxShape legendShape;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 2.0),
          height: 20.0,
          width: 18.0,
          decoration: BoxDecoration(
            shape: legendShape,
            color: color,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Container(
          width: 105,
          child: Text(
            title,
            style: style,
            softWrap: true,
            textAlign: TextAlign.center,
            maxLines: null,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
      ],
    );
  }
}
