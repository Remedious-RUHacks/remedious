import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/DataModels/GeneralUser.dart';
import 'package:remedious/styles.dart';

// ignore: must_be_immutable
class Onboarding extends StatefulWidget {
  Onboarding(this.user);
  GeneralUser user;
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  GeneralUser user;

  TextEditingController ageController  = TextEditingController();
  TextEditingController healthController  = TextEditingController();
  TextEditingController medicationController  = TextEditingController();

  FocusNode myFocusNode = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  FocusNode myFocusNode3 = FocusNode();

  @override
  void initState(){
    super.initState();
    user = widget.user;

    myFocusNode.addListener(() {setState(() {});});
    myFocusNode2.addListener(() {setState(() {});});

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: bgColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBar(context),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height:30),
                        Text('Welcome '+user.firstName,style: TextStyle(
                          color: grey1,
                          fontSize: 14
                        ),),
                        SizedBox(height:15),
                        Text('A few more steps to go....',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                        SizedBox(height: 10,),
                        Center(
                          child: TabBar(
                            tabs: [
                              Tab(icon: Icon(Icons.note),text: "Personal",),
                              Tab(icon: Icon(Icons.masks),text: "COVID-19 Questions",),
                              Tab(icon: Icon(Icons.medication),text: "Remedy details",),
                            ],
                            labelColor: blue1,
                            unselectedLabelColor: Colors.white,
                          ),
                        ),
                        SizedBox(height:30),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height:MediaQuery.of(context).size.height *1.5,
                          child: TabBarView(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                // height:MediaQuery.of(context).size.height,
                                child: Column(
                                  children: <Widget>[
                                    Text("Personal Details".toUpperCase(),style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25
                                    ),),
                                    SizedBox(height:30),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 58,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              color: grey2,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: TextFormField(
                                                controller: ageController,
                                                focusNode: myFocusNode,
                                                // autofillHints: [],
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                ],
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(color:Colors.white,fontSize: 14),
                                                decoration: InputDecoration(
                                                  labelText: 'Age',
                                                  // hintText: 'Email Address',
                                                  labelStyle: TextStyle(
                                                      color:myFocusNode.hasFocus? blue1:Colors.white,
                                                      fontSize: 14,
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
                                        ),
                                        SizedBox(width:20),
                                        GenderDropDown()
                                      ],
                                    ),
                                    SizedBox(height: 30,),
                                    BackgroundDropDown(),
                                    SizedBox(height:30),
                                    Text("Health Conditions".toUpperCase(),style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25
                                    ),),
                                    SizedBox(height:16),
                                    Text("Do you have any existing health conditions",style:TextStyle(
                                      color: grey3,
                                      fontSize: 18
                                    )),
                                    SizedBox(height: 16,),
                                    Container(
                                      height: 140,
                                      width: 380,
                                      decoration: BoxDecoration(
                                          color: grey2,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20, top: 5),
                                        child: TextFormField(
                                          maxLines: null,
                                          controller: healthController,
                                          focusNode: myFocusNode2,
                                          textAlign: TextAlign.start,
                                          // autofillHints: [],
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(color:Colors.white,fontSize: 14),
                                          decoration: InputDecoration(
                                            labelText: 'Health Conditions',
                                            // hintText: 'Email Address',
                                            labelStyle: TextStyle(
                                              color:myFocusNode2.hasFocus? blue1:Colors.white,
                                              fontSize: 14,
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
                                    SizedBox(height:30),
                                    Text("Medication".toUpperCase(),style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25
                                    ),),
                                    SizedBox(height:16),
                                    Text("Are you taking any medication?",style:TextStyle(
                                      color: grey3,
                                      fontSize: 18
                                    )),
                                    SizedBox(height: 16,),
                                    Container(
                                      height: 140,
                                      width: 380,
                                      decoration: BoxDecoration(
                                          color: grey2,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20, top: 5),
                                        child: TextFormField(
                                          maxLines: null,
                                          controller: medicationController,
                                          focusNode: myFocusNode3,
                                          textAlign: TextAlign.start,
                                          // autofillHints: [],
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(color:Colors.white,fontSize: 14),
                                          decoration: InputDecoration(
                                            labelText: 'Medication',
                                            // hintText: 'Email Address',
                                            labelStyle: TextStyle(
                                              color:myFocusNode3.hasFocus? blue1:Colors.white,
                                              fontSize: 14,
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
                                  ],
                                ),
                              ),
                              Icon(Icons.directions_transit,color: Colors.white),
                              Icon(Icons.directions_bike,color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String gender = 'Gender';
String ethnicBackground = "Ethnic Background";
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

class GenderDropDown extends StatefulWidget {
  @override
  _GenderDropDownState createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: grey2,
          borderRadius: BorderRadius.circular(10)      ),
      width: 180 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: gender,
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
              gender = newValue;
            });
          },
          dropdownColor: grey2,
          items: <String>['Gender','Male', 'Female', 'Other', 'Rather Not Say']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style:TextStyle(
                  color:Colors.white,
              )),
            );
          }).toList(),
        ),
      ),
    );
  }
}



class BackgroundDropDown extends StatefulWidget {
  @override
  _BackgroundDropDownState createState() => _BackgroundDropDownState();
}

class _BackgroundDropDownState extends State<BackgroundDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: grey2,
          borderRadius: BorderRadius.circular(10)      ),
      width: 380 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: ethnicBackground,
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
              ethnicBackground = newValue;
            });
          },
          dropdownColor: grey2,
          items: ethnicBackgrounds
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style:TextStyle(
                color:Colors.white,
              )),
            );
          }).toList(),
        ),
      ),
    );
  }
}