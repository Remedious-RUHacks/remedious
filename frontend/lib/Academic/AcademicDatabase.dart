import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/DataModels/Filter.dart';
import 'package:remedious/DataModels/GeneralUser.dart';
import 'package:remedious/DataModels/Symptom&Remedy.dart';
import 'package:remedious/styles.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

class AcademicDatabase extends StatefulWidget {
  @override
  _AcademicDatabaseState createState() => _AcademicDatabaseState();
}

class _AcademicDatabaseState extends State<AcademicDatabase> {

  GeneralUser user;

  TextEditingController searchController = TextEditingController();
  List<Widget> widgetList = <Widget>[];

  ScrollController controller1 = ScrollController();
  ScrollController controller2 = ScrollController();


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    user = ModalRoute.of(context).settings.arguments;
    makeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        child: SmoothScrollWeb(
          controller: controller1,
          child: SingleChildScrollView(
            controller: controller1,
            physics: NeverScrollableScrollPhysics(),
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
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, academicHomeRoute,arguments: user);
                            },
                            child: Text("Home",style: TextStyle(
                                color: Colors.white,
                                fontSize: 14
                            ),),
                          ),
                          SizedBox(width:30),
                          Text("Database",style: TextStyle(
                              color: blue1,
                              fontSize: 14
                          ),),
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
                        image: AssetImage("images/Database.webp"),
                      ),
                      SizedBox(width: 10,),
                      Text("Database",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.85,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.fullscreen,color: blue1,)
                              ],
                            ),
                          ),
                          SizedBox(height:15),
                          Container(
                            height:2,
                            width: MediaQuery.of(context).size.width*0.85,
                            color: grey4,
                          ),
                          SizedBox(height:15),
                          Container(
                            height: 50,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 15,),
                                Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: blue1,width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width:20),
                                      Image.asset('images/Filter.webp'),
                                      SizedBox(width: 20,),
                                      Text("Filter",style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14
                                      ),)
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: blue1,width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: TextFormField(
                                      controller: searchController,
                                      style: TextStyle(
                                          color: blue1,
                                          fontSize: 14
                                      ),
                                      decoration: InputDecoration(
                                        prefixIcon: InkWell(
                                          child: Image.asset("images/Search.webp")
                                        ),
                                        hintText: 'Search database',
                                        hintStyle: TextStyle(
                                            color: blue1,
                                            fontSize: 14
                                        ),
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
                                Spacer(),
                                Text("Add record", style: TextStyle(
                                    color: blue1,
                                    fontSize: 14
                                ),),
                                SizedBox(width:15),
                                Container(
                                  height:50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color:blue1,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text("EXPORT",style: TextStyle(
                                        fontSize: 14,
                                      color: Colors.black
                                    ),),
                                  ),
                                ),
                                SizedBox(width: 15,)
                              ],
                            ),
                          ),
                          SizedBox(height:10),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.85,
                            decoration: BoxDecoration(
                              color: grey4,
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: blue1,
                                  width: 1
                                )
                              )
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: blue1,width: 1),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                ),
                                SizedBox(width:15),
                                Container(width: 15,height: 15,),
                                SizedBox(width:15),
                                Container(
                                  width: 185,
                                  child: Text("REMEDY",style:  TextStyle(
                                      color: blue1,
                                      fontSize: 14,
                                    fontWeight: FontWeight.w700
                                  ),),

                                ),
                                Container(
                                  width: 185,
                                  child: Text("SYMPTOM",style:  TextStyle(
                                      color: blue1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),),
                                ),
                                Container(
                                  width: 110,
                                  child: Text("PAIN_DIFF",style:  TextStyle(
                                      color: blue1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),),
                                ),
                                Container(
                                  width: 150,
                                  child: Text("FREQUENCY_DIFF",style:  TextStyle(
                                      color: blue1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),),
                                ),
                                Container(
                                  width: 110,
                                  child: Text("ETHINICITY",style:  TextStyle(
                                      color: blue1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),),
                                ),
                                Container(
                                  width: 40,
                                  child: Text("AGE",style:  TextStyle(
                                      color: blue1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),),
                                ),
                                Container(
                                  width: 70,
                                  child: Text("GENDER",style:  TextStyle(
                                      color: blue1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),),
                                ),
                                Container(
                                  width: 70,
                                  // child: Center(child: Icon(Icons.more_vert,color:blue1))
                                ),
                              ],
                            ),
                          ),
                          AnimatedCrossFade(
                            duration: Duration(seconds: 2),
                            crossFadeState: widgetList.isNotEmpty?CrossFadeState.showFirst:CrossFadeState.showSecond,
                            firstChild: Container(
                              height: MediaQuery.of(context).size.height-185,
                              child: SmoothScrollWeb(
                                controller: controller2,
                                child: SingleChildScrollView(
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: controller2,
                                  child: Column(
                                    children: widgetList,
                                  ),
                                ),
                              ),
                            ),
                            secondChild: Container(
                              height: MediaQuery.of(context).size.height*0.6,
                              width: MediaQuery.of(context).size.width*0.85,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                bottomBar(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void makeList() async {
    List<Remedy> remedyList = <Remedy>[
      Remedy(name: "Green Tea",symptom: "A high temperature",amount: "250ml",frequency:"5 times a day",user: user,frequencyDifference: -5,painDifference: 7 ),
      Remedy(name: "Pranyam (Yoga)",symptom: "Shortness of breath",amount: "5 mins",frequency:"1 time a day",user: user..ethnicBackground="Caucasian"..age=55..gender="Female",frequencyDifference: -5,painDifference: 7 ),
      Remedy(name: "Warm Baths",symptom: "Dizziness",amount: "30 mins",frequency:"1 time a day",user: user..ethnicBackground="Caucasian"..age=55..gender="Female",frequencyDifference: -5,painDifference: 4 ),
      Remedy(name: "Warm Showers",symptom: "Difficulty sleeping",amount: "10 mins",frequency:"2 times a day",user: user..ethnicBackground="Native American"..age=23..gender="Male",frequencyDifference: -4,painDifference: 6 ),
      Remedy(name: "Vapor Rub",symptom: "Rashes",amount: "5 mins",frequency:"3 times a day",user: user..ethnicBackground="Native American"..age=40..gender="Female",frequencyDifference: -4,painDifference: 7 ),
    Remedy(name: "Humidity",symptom: "Feeling sick",amount: "20 mins",frequency:"4 times a day",user: user..ethnicBackground="Pacific"..age=32..gender="Male",frequencyDifference: -5,painDifference: 4 ),
    Remedy(name: "Hydration",symptom: "Loss of appetite",amount: "5 mins",frequency:"7 times a day",user: user..ethnicBackground="North East Asian"..age=19..gender="Male",frequencyDifference: -2,painDifference: 4 ),
    Remedy(name: "Vitamin C",symptom: "Sore throat",amount: "5 mins",frequency:"1 time a day",user: user..ethnicBackground="Mixed Race"..age=25..gender="Female",frequencyDifference: -7,painDifference: 7 ),
    Remedy(name: "Turmeric",symptom: "Joint pain",amount: "15 mins",frequency:"2 times a day",user: user..ethnicBackground="Arctic"..age=30..gender="Female",frequencyDifference: -6,painDifference: 8 ),
    Remedy(name: "Peroxide",symptom: "Ear aches",amount: "20 mins",frequency:"1 time a day",user: user..ethnicBackground="Arctic"..age=35..gender="Male",frequencyDifference: -3,painDifference: 6 ),
    Remedy(name: "Onion",symptom: "Problems with memory",amount: "20 mins",frequency:"2 times a day",user: user..ethnicBackground="North East African"..age=29..gender="Female",frequencyDifference: -6,painDifference: 8 ),
    Remedy(name: "Castor Oil",symptom: "Diarrhoea",amount: "10 mins",frequency:"1 time a day",user: user..ethnicBackground="Other Race"..age=54..gender="Male",frequencyDifference: -3,painDifference: 3 ),
    Remedy(name: "Chamoline Tea",symptom: "Stomach aches",amount: "5 mins",frequency:"3 times a day",user: user..ethnicBackground="Indigenous Australian"..age=64..gender="Male",frequencyDifference: -6,painDifference: 6 ),
    Remedy(name: "Heating Pad",symptom: "Pins and needles",amount: "20 mins",frequency:"2 times a day",user: user..ethnicBackground="Rather Not Say"..age=44..gender="Female",frequencyDifference: -4,painDifference: 6 ),
    ];

    await Future.delayed(Duration(seconds: 3));

    widgetList = [];
    for (Remedy r in remedyList){
      widgetList.add(RemedyBar(r));
    }
    setState(() {

    });
  }
}

// ignore: must_be_immutable
class RemedyBar extends StatefulWidget {

  Remedy r;
  RemedyBar(this.r);

  @override
  _RemedyBarState createState() => _RemedyBarState();
}

class _RemedyBarState extends State<RemedyBar> {

  Remedy r;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    r = widget.r;
    gender = genders[random.nextInt(4)];
    ethnicBackground = ethnicBackgrounds[random.nextInt(ethnicBackgrounds.length-1)];
    age = (random.nextInt(100)+15).toString();
  }
  Random random = Random();
  List genders = ['Gender','Male', 'Female', 'Other', 'Rather Not Say'];
  List<String> ethnicBackgrounds = [
    "Ethnic Background",
    "Mixed Race",
    "Arctic",
    "Caucasian ",
    "Indigenous Australian",
    "Native American",
    "North East Asian ",
    "Pacific ",
    "South East Asian",
    "West African",
    "Rather Not Say",
    "Other Race",
  ];
  String gender;
  String ethnicBackground;
  String age;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width*0.85,
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
                  color: blue1,
                  width: 1
              )
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10,),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: Border.all(color: blue1,width: 1),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              value: r.selected,
              onChanged: (val){
                r.selected = val;
                setState(() {

                });
              },
              activeColor: blue1,
            ),
          ),
          SizedBox(width:15),
          Container(child: Image.asset("images/DropDown.webp"),width: 15,height: 15,),
          SizedBox(width:15),
          Container(
            width: 185,
            child: Text(r.name,style:  TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700
            ),),

          ),
          Container(
            width: 185,
            child: Text(r.symptom,style:  TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700
            ),),
          ),
          Container(
            width: 110,
            child: Center(
              child: Text(r.painDifference.toString(),style:  TextStyle(
                  color: r.painDifference>0?green1:r.painDifference<0?red1:Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),),
            ),
          ),
          Container(
            width: 150,
            child: Center(
              child: Text(r.frequencyDifference.toString(),style:  TextStyle(
                  color: r.frequencyDifference>0?green1:r.frequencyDifference<0?red1:Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),),
            ),
          ),
          Container(
            width: 110,
            child: Text(ethnicBackground,style:  TextStyle(
                color: blue1,
                fontSize: 14,
                fontWeight: FontWeight.w700
            ),),
          ),
          Container(
            width: 40,
            child: Center(
              child: Text(age.toString(),style:  TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),),
            ),
          ),
          Container(
            width: 70,
            child: Center(
              child: Text(gender[0].toUpperCase(),style:  TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),),
            ),
          ),
          Container(
              width: 70,
              child: Center(child: Icon(Icons.more_vert,color:blue1))
          ),
        ],
      ),
    );
  }
}
List<String> filters =<String>[];
List<Filter> allFilters = [];
class NewCheckBox extends StatefulWidget {

  Filter value;
  NewCheckBox(this.value);

  @override
  _NewCheckBoxState createState() => _NewCheckBoxState();
}

class _NewCheckBoxState extends State<NewCheckBox> {

  Filter value;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      child: Checkbox(
        shape: CircleBorder(
          side: BorderSide(color: blue1,width: 1)
        ),
        onChanged: (bool val) {
          val==true?filters.add(value.name):filters.remove(value.name);
          value.selected = val;
          setState(() {});
        },
        value: value.selected,
        activeColor: blue1,
      ),
    );
  }
}

class FilterDropDown extends StatefulWidget {
  @override
  _FilterDropDownState createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: grey2,
          borderRadius: BorderRadius.circular(10)      ),
      width: MediaQuery.of(context).size.width*0.5 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: "Corresponding Symptom",
          icon: Icon(Icons.arrow_drop_down,color:Colors.white),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            color:Colors.white,
          ),
          underline: Container(

          ),
          onChanged: (String newValue) {
            setState(() {
            });
          },
          dropdownColor: grey2,
          items:<DropdownMenuItem>[

          ]+ allFilters
              .map<DropdownMenuItem<String>>((Filter value) {
            return DropdownMenuItem<String>(
              value: value.name,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Text(value.name,style:TextStyle(
                    color:Colors.white,
                  )),
                  Spacer(),
                  NewCheckBox(value),
                  SizedBox(width: 10,)
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}