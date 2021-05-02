import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/DataModels/GeneralUser.dart';
import 'package:remedious/DataModels/Symptom&Remedy.dart';
import 'package:remedious/styles.dart';

// ignore: must_be_immutable
class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  GeneralUser user;

  TextEditingController ageController  = TextEditingController();
  TextEditingController healthController  = TextEditingController();
  TextEditingController medicationController  = TextEditingController();
  TextEditingController treatmentController  = TextEditingController();
  TextEditingController symptomController  = TextEditingController();
  TextEditingController remedyController  = TextEditingController();
  TextEditingController remedyAmountController  = TextEditingController();
  TextEditingController remedyFrequencyController  = TextEditingController();
  TextEditingController remedySymptomController  = TextEditingController();

  FocusNode myFocusNode = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  FocusNode myFocusNode3 = FocusNode();
  FocusNode myFocusNode4 = FocusNode();
  FocusNode myFocusNode5 = FocusNode();
  FocusNode myFocusNode6 = FocusNode();
  FocusNode myFocusNode7 = FocusNode();
  FocusNode myFocusNode8 = FocusNode();
  FocusNode myFocusNode9 = FocusNode();

  TabController tabController;

  bool symptom = true;
  bool tested = true;
  bool treatment = true;
  bool recovered = true;
  bool longTerm = true;
  bool remedies = true;
  bool newLevel = true;

  @override
  void initState(){
    super.initState();
    user = ModalRoute.of(context).settings.arguments;

    myFocusNode.addListener(() {setState(() {});});
    myFocusNode2.addListener(() {setState(() {});});
    myFocusNode3.addListener(() {setState(() {});});
    myFocusNode4.addListener(() {setState(() {});});
    myFocusNode5.addListener(() {setState(() {});});
    myFocusNode6.addListener(() {setState(() {});});
    myFocusNode7.addListener(() {setState(() {});});
    myFocusNode8.addListener(() {setState(() {});});
    myFocusNode9.addListener(() {setState(() {});});

    tabController  = TabController(length: 3,vsync: this);
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
                            controller: tabController,
                            tabs: [
                              Tab(icon: Icon(Icons.note),text: "Personal",),
                              Tab(icon: Icon(Icons.masks),text: "COVID-19 Questions",),
                              Tab(icon: Icon(Icons.medical_services),text: "Remedy details",),
                            ],
                            labelColor: blue1,
                            unselectedLabelColor: Colors.white,
                          ),
                        ),
                        SizedBox(height:30),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height:MediaQuery.of(context).size.height*0.6,
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: SingleChildScrollView(
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
                                      SizedBox(height:30),
                                      InkWell(
                                        onTap: (){
                                          tabController.animateTo(1);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 140,
                                          decoration: BoxDecoration(
                                              color:blue1,
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Center(
                                            child: Text("Next",style: TextStyle(
                                                fontSize: 18
                                            ),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Text("Covid-19 Questions".toUpperCase(),style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25
                                      ),),
                                      SizedBox(height:30),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text("Have you experience any symptoms for Covid-19?",style:TextStyle(
                                            color:Colors.white,
                                            fontSize: 18,
                                          )),
                                          SizedBox(width:10),
                                          Container(
                                            height:40,
                                            width: 80,
                                            child: CustomSwitch(
                                              activeColor: blue1,
                                              value: symptom,
                                              onChanged: (v){
                                                setState((){
                                                  symptom = v;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height:30),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text("Have you tested for Covid-19?",style:TextStyle(
                                            color:Colors.white,
                                            fontSize: 18,
                                          )),
                                          SizedBox(width:10),
                                          Container(
                                            height:40,
                                            width: 80,
                                            child: CustomSwitch(
                                              activeColor: blue1,
                                              value: tested,
                                              onChanged: (v){
                                                setState((){
                                                  tested = v;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height:30),
                                    ]+ <Widget>[
                                      AnimatedCrossFade(
                                        duration:Duration(milliseconds:500),
                                        crossFadeState: tested == false?CrossFadeState.showFirst:CrossFadeState.showSecond,
                                        firstChild: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text("Is the result positive or negative",style:TextStyle(
                                              color:Colors.white,
                                              fontSize: 18,
                                            )),
                                            SizedBox(width:10),
                                            Container(
                                              height:56,
                                              decoration: BoxDecoration(
                                                  color: grey2,
                                                  borderRadius: BorderRadius.circular(10)      ),
                                              width: 150 ,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8,top: 3),
                                                child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  value: testResult,
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
                                                      testResult = newValue;
                                                      print(testResult);
                                                    });
                                                  },
                                                  dropdownColor: grey2,
                                                  items: ['Choose','Negative','Positive']
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
                                            )
                                          ],
                                        ),
                                        secondChild: Container(),
                                      ),
                                      SizedBox(height:30),
                                    ]+<Widget>[
                                      AnimatedCrossFade(
                                        duration: Duration(milliseconds: 500),
                                        crossFadeState: testResult=='Positive'?CrossFadeState.showFirst:CrossFadeState.showSecond,
                                        firstChild: Container(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Have you received any treatments?",style:TextStyle(
                                                    color:Colors.white,
                                                    fontSize: 18,
                                                  )),
                                                  SizedBox(width:10),
                                                  Container(
                                                    height:40,
                                                    width: 80,
                                                    child: CustomSwitch(
                                                      activeColor: blue1,
                                                      value: treatment,
                                                      onChanged: (v){
                                                        setState((){
                                                          treatment = v;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:30),
                                            ],
                                          )
                                        ),
                                        secondChild: Container(),
                                      )
                                    ]+<Widget>[
                                      AnimatedCrossFade(
                                        duration:Duration(milliseconds: 500),
                                        crossFadeState: treatment==false?CrossFadeState.showFirst:CrossFadeState.showSecond,
                                        firstChild:Container(
                                          child: Column(
                                            children:<Widget>[
                                              Center(
                                                child: Container(
                                                  height: 140,
                                                  width: MediaQuery.of(context).size.width*0.5,
                                                  decoration: BoxDecoration(
                                                      color: grey2,
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 20, top: 5),
                                                    child: TextFormField(
                                                      maxLines: null,
                                                      controller: treatmentController,
                                                      focusNode: myFocusNode4,
                                                      textAlign: TextAlign.start,
                                                      // autofillHints: [],
                                                      keyboardType: TextInputType.number,
                                                      style: TextStyle(color:Colors.white,fontSize: 14),
                                                      decoration: InputDecoration(
                                                        labelText: 'Treatment',
                                                        // hintText: 'Email Address',
                                                        labelStyle: TextStyle(
                                                          color:myFocusNode4.hasFocus? blue1:Colors.white,
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
                                              SizedBox(height:30),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Have you recovered from Covid-19?",style:TextStyle(
                                                    color:Colors.white,
                                                    fontSize: 18,
                                                  )),
                                                  SizedBox(width:10),
                                                  Container(
                                                    height:40,
                                                    width: 80,
                                                    child: CustomSwitch(
                                                      activeColor: blue1,
                                                      value: recovered,
                                                      onChanged: (v){
                                                        setState((){
                                                          recovered = v;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:30),
                                            ]
                                          ),
                                        ),
                                        secondChild: Container(),
                                      )
                                    ]+<Widget>[
                                      AnimatedCrossFade(
                                        duration: Duration(milliseconds: 500),
                                        crossFadeState: recovered==false?CrossFadeState.showFirst:CrossFadeState.showSecond,
                                        firstChild: Container(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Are you experiencing any long term health impacts?",style:TextStyle(
                                                    color:Colors.white,
                                                    fontSize: 18,
                                                  )),
                                                  SizedBox(width:10),
                                                  Container(
                                                    height:40,
                                                    width: 80,
                                                    child: CustomSwitch(
                                                      activeColor: blue1,
                                                      value: longTerm,
                                                      onChanged: (v){
                                                        setState((){
                                                          longTerm = v;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:30)
                                            ],
                                          ),
                                        ),
                                        secondChild: Container(),
                                      )
                                    ]+<Widget>[
                                      AnimatedCrossFade(
                                        duration:Duration(milliseconds: 500),
                                        crossFadeState: longTerm==false?CrossFadeState.showFirst:CrossFadeState.showSecond,
                                        firstChild:Container(
                                          child: Column(
                                              children:<Widget>[
                                                Center(
                                                  child: SymptomDropDown(),
                                                  // child: Container(
                                                  //   height: 140,
                                                  //   width: MediaQuery.of(context).size.width*0.5,
                                                  //   decoration: BoxDecoration(
                                                  //       color: grey2,
                                                  //       borderRadius: BorderRadius.circular(10)
                                                  //   ),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.only(left: 20, top: 5),
                                                  //     child: TextFormField(
                                                  //       maxLines: null,
                                                  //       controller: symptomController,
                                                  //       focusNode: myFocusNode5,
                                                  //       textAlign: TextAlign.start,
                                                  //       // autofillHints: [],
                                                  //       keyboardType: TextInputType.text,
                                                  //       style: TextStyle(color:Colors.white,fontSize: 14),
                                                  //       decoration: InputDecoration(
                                                  //         labelText: 'Symptoms',
                                                  //         // hintText: 'Email Address',
                                                  //         labelStyle: TextStyle(
                                                  //           color:myFocusNode5.hasFocus? blue1:Colors.white,
                                                  //           fontSize: 14,
                                                  //         ),
                                                  //
                                                  //         border:null,
                                                  //         enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                                  //             color: Color.fromRGBO(0,0,0,0)
                                                  //         )),
                                                  //         focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                                  //             color: Color.fromRGBO(0,0,0,0)
                                                  //         )),
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ),
                                                SizedBox(height:30),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width:MediaQuery.of(context).size.width*0.5-100,
                                                      child: Text("On a 10-point scale (0 - no pain, 10 - very painful), please indicate the level of pain. Put 0 if not applicable.",style:TextStyle(
                                                        color:Colors.white,
                                                        fontSize: 18,
                                                      ),maxLines: null,),
                                                    ),
                                                    SizedBox(width:10),
                                                    PainDropDown()
                                                  ],
                                                ),
                                                SizedBox(height:30),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width:MediaQuery.of(context).size.width*0.5-100,
                                                      child: Text("On a 10-point scale (0 - never happened, 10 - never stopped), please indicate the frequency of the symptom. Put 0 if not applicable.",style:TextStyle(
                                                        color:Colors.white,
                                                        fontSize: 18,
                                                      ),maxLines: null,),
                                                    ),
                                                    SizedBox(width:10),
                                                    FrequencyDropDown()
                                                  ],
                                                ),
                                                SizedBox(height:30),
                                              ]
                                          ),
                                        ),
                                        secondChild: Container(),
                                      )
                                    ]+<Widget>[
                                      InkWell(
                                        onTap: (){
                                          tabController.animateTo(2);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 140,
                                          decoration: BoxDecoration(
                                              color:blue1,
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Center(
                                            child: Text("Next",style: TextStyle(
                                                fontSize: 18
                                            ),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  child:SingleChildScrollView(
                                      child:Column(
                                        children: <Widget>[
                                          Text("Remedy Details".toUpperCase(),style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25
                                          ),),
                                          SizedBox(height:30),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width:MediaQuery.of(context).size.width*0.5-100,
                                                child: Text("Are you taking any remedies that are not prescribed by doctors?",style:TextStyle(
                                                  color:Colors.white,
                                                  fontSize: 18,
                                                ),maxLines: null,),
                                              ),
                                              SizedBox(width:10),
                                              Container(
                                                height:40,
                                                width: 80,
                                                child: CustomSwitch(
                                                  activeColor: blue1,
                                                  value: remedies,
                                                  onChanged: (v){
                                                    setState((){
                                                      remedies = v;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height:30),
                                        ]+<Widget>[
                                          AnimatedCrossFade(
                                            duration: Duration(milliseconds: 500),
                                            crossFadeState: remedies==false?CrossFadeState.showFirst:CrossFadeState.showSecond,
                                            firstChild:Container(
                                              child:Column(
                                                children: <Widget>[
                                                  Container(
                                                    height: 58,
                                                    width: MediaQuery.of(context).size.width*0.5,
                                                    decoration: BoxDecoration(
                                                        color: grey2,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: TextFormField(
                                                          controller: remedyController,
                                                          focusNode: myFocusNode6,
                                                          // autofillHints: [],
                                                          keyboardType: TextInputType.number,
                                                          style: TextStyle(color:Colors.white,fontSize: 14),
                                                          decoration: InputDecoration(
                                                            labelText: 'Name of the Remedy',
                                                            // hintText: 'Email Address',
                                                            labelStyle: TextStyle(
                                                              color:myFocusNode6.hasFocus? blue1:Colors.white,
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
                                                  SizedBox(height:30),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 58,
                                                        width: MediaQuery.of(context).size.width*0.23,
                                                        decoration: BoxDecoration(
                                                            color: grey2,
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child: Center(
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 15),
                                                            child: TextFormField(
                                                              controller: remedyAmountController,
                                                              focusNode: myFocusNode7,
                                                              // autofillHints: [],
                                                              keyboardType: TextInputType.number,
                                                              style: TextStyle(color:Colors.white,fontSize: 14),
                                                              decoration: InputDecoration(
                                                                labelText: 'Amount',
                                                                // hintText: 'Email Address',
                                                                labelStyle: TextStyle(
                                                                  color:myFocusNode7.hasFocus? blue1:Colors.white,
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
                                                      SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                                                      Container(
                                                        height: 58,
                                                        width: MediaQuery.of(context).size.width*0.23,
                                                        decoration: BoxDecoration(
                                                            color: grey2,
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child: Center(
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 15),
                                                            child: TextFormField(
                                                              controller: remedyFrequencyController,
                                                              focusNode: myFocusNode8,
                                                              // autofillHints: [],
                                                              keyboardType: TextInputType.number,
                                                              style: TextStyle(color:Colors.white,fontSize: 14),
                                                              decoration: InputDecoration(
                                                                labelText: 'Frequency',
                                                                // hintText: 'Email Address',
                                                                labelStyle: TextStyle(
                                                                  color:myFocusNode8.hasFocus? blue1:Colors.white,
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
                                                    ],
                                                  ),
                                                  SizedBox(height:30),
                                                  Container(
                                                    height: 58,
                                                    width: MediaQuery.of(context).size.width*0.5,
                                                    decoration: BoxDecoration(
                                                        color: grey2,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: TextFormField(
                                                          controller: remedySymptomController,
                                                          focusNode: myFocusNode9,
                                                          // autofillHints: [],
                                                          keyboardType: TextInputType.number,
                                                          style: TextStyle(color:Colors.white,fontSize: 14),
                                                          decoration: InputDecoration(
                                                            labelText: 'Corresponding Symptom',
                                                            // hintText: 'Email Address',
                                                            labelStyle: TextStyle(
                                                              color:myFocusNode9.hasFocus? blue1:Colors.white,
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
                                                  SizedBox(height:30),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width:MediaQuery.of(context).size.width*0.5-100,
                                                        child: Text("Did the level of pain or frequency of your symptom changed after taking this remedy?",style:TextStyle(
                                                          color:Colors.white,
                                                          fontSize: 18,
                                                        ),maxLines: null,),
                                                      ),
                                                      SizedBox(width:10),
                                                      Container(
                                                        height:40,
                                                        width: 80,
                                                        child: CustomSwitch(
                                                          activeColor: blue1,
                                                          value: newLevel,
                                                          onChanged: (v){
                                                            setState((){
                                                              newLevel = v;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height:30),
                                                ],
                                              )
                                            ),
                                            secondChild: Container(),
                                          )
                                        ]+<Widget>[
                                          AnimatedCrossFade(
                                            duration:Duration(milliseconds: 500),
                                            crossFadeState: newLevel==false?CrossFadeState.showFirst:CrossFadeState.showSecond,
                                            firstChild:Container(
                                              child: Column(
                                                  children:<Widget>[
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width:MediaQuery.of(context).size.width*0.5-100,
                                                          child: Text("On a 10-point scale (0 - no pain, 10 - very painful), please indicate the level of pain. Put 0 if not applicable.",style:TextStyle(
                                                            color:Colors.white,
                                                            fontSize: 18,
                                                          ),maxLines: null,),
                                                        ),
                                                        SizedBox(width:10),
                                                        Pain2DropDown()
                                                      ],
                                                    ),
                                                    SizedBox(height:30),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width:MediaQuery.of(context).size.width*0.5-100,
                                                          child: Text("On a 10-point scale (0 - never happened, 10 - never stopped), please indicate the frequency of the symptom. Put 0 if not applicable.",style:TextStyle(
                                                            color:Colors.white,
                                                            fontSize: 18,
                                                          ),maxLines: null,),
                                                        ),
                                                        SizedBox(width:10),
                                                        Frequency2DropDown()
                                                      ],
                                                    ),
                                                    SizedBox(height:30),
                                                  ]
                                              ),
                                            ),
                                            secondChild: Container(),
                                          ),
                                          SizedBox(height:30)
                                        ]+<Widget>[
                                          InkWell(
                                            onTap: (){
                                              Navigator.pushNamed(context, generalHomeRoute,arguments: user);
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  color:blue1,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              child: Center(
                                                child: Text("Submit",style: TextStyle(
                                                    fontSize: 18
                                                ),),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  )
                              )
                            ],
                          ),
                        ),

                      ],
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
}

String gender = 'Gender';
String ethnicBackground = "Ethnic Background";
String testResult = "Choose";
String pain = "0";
String frequency = "0";
String pain2 = "0";
String frequency2 = "0";
List<String> symptoms = [];
String remedySymptom = "A high temperature";

List<Symptom> symptomList = [
  Symptom("A high temperature"),
  Symptom("Cough"),
  Symptom("Headaches"),
  Symptom("Sore throat"),
  Symptom("Changes to sense of smell or taste"),
  Symptom("Rashes"),
  Symptom("Feeling sick"),
  Symptom("Diarrhoea"),
  Symptom("Stomach aches"),
  Symptom("Loss of appetite"),
  Symptom("Extreme tiredness"),
  Symptom("Shortness of breath"),
  Symptom("Chest pain or tightness"),
  Symptom("Problems with memory"),
  Symptom("Difficulty sleeping"),
  Symptom("Heart palpitations"),
  Symptom("Dizziness"),
  Symptom("Pins and needles"),
  Symptom("Joint pain"),
  Symptom("Depression and anxiety"),
  Symptom("Tinnitus"),
  Symptom("Ear aches"),
  Symptom("Others"),
];

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

List<String> painLevel = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10"
];

List<String> frequencyLevel = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10"
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

class PainDropDown extends StatefulWidget {
  @override
  _PainDropDownState createState() => _PainDropDownState();
}

class _PainDropDownState extends State<PainDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: grey2,
          borderRadius: BorderRadius.circular(10)      ),
      width: 80 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: pain,
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
              pain = newValue;
            });
          },
          dropdownColor: grey2,
          items: painLevel
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



class FrequencyDropDown extends StatefulWidget {
  @override
  _FrequencyDropDownState createState() => _FrequencyDropDownState();
}

class _FrequencyDropDownState extends State<FrequencyDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: grey2,
          borderRadius: BorderRadius.circular(10)      ),
      width: 80 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: frequency,
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
              frequency = newValue;
            });
          },
          dropdownColor: grey2,
          items: frequencyLevel
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


class Pain2DropDown extends StatefulWidget {
  @override
  _Pain2DropDownState createState() => _Pain2DropDownState();
}

class _Pain2DropDownState extends State<Pain2DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: grey2,
          borderRadius: BorderRadius.circular(10)      ),
      width: 80 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: pain2,
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
              pain2 = newValue;
            });
          },
          dropdownColor: grey2,
          items: painLevel
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



class Frequency2DropDown extends StatefulWidget {
  @override
  _Frequency2DropDownState createState() => _Frequency2DropDownState();
}

class _Frequency2DropDownState extends State<Frequency2DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: grey2,
          borderRadius: BorderRadius.circular(10)      ),
      width: 80 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: frequency2,
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
              frequency2 = newValue;
            });
          },
          dropdownColor: grey2,
          items: frequencyLevel
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


class SymptomDropDown extends StatefulWidget {
  @override
  _SymptomDropDownState createState() => _SymptomDropDownState();
}

class _SymptomDropDownState extends State<SymptomDropDown> {
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
          value: "Choose",
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
          items:<DropdownMenuItem<String>>[
            DropdownMenuItem<String>(
              value: "Choose",
              child: Text("Choose",style:TextStyle(
                color:Colors.white,
              )),
            )
          ]+ symptomList
              .map<DropdownMenuItem<String>>((Symptom value) {
            return DropdownMenuItem<String>(
              value: value.name,
              child: Row(
                children: [
                  Text(value.name,style:TextStyle(
                    color:Colors.white,
                  )),
                  Container(
                    decoration: BoxDecoration(
                      color: grey2,
                      border: Border.all(color: Colors.white,width: 1)
                    ),
                    child: Checkbox(
                      activeColor: blue1,
                      onChanged: (bool val) {
                        val==true?symptoms.add(value.name):symptoms.remove(value.name);
                        value.selected = val;
                        setState(() {

                        });
                      },
                      value: value.selected,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


//
// class TestDropDown extends StatefulWidget {
//   @override
//   _TestDropDownState createState() => _TestDropDownState();
// }
//
// class _TestDropDownState extends State<TestDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height:56,
//       decoration: BoxDecoration(
//           color: grey2,
//           borderRadius: BorderRadius.circular(10)      ),
//       width: 150 ,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 8,top: 3),
//         child: DropdownButton<String>(
//           isExpanded: true,
//           value: testResult,
//           icon: Icon(Icons.arrow_drop_down,color:Colors.white),
//           iconSize: 24,
//           elevation: 16,
//           style: TextStyle(
//             color:Colors.white,
//           ),
//           underline: Container(
//
//           ),
//           onChanged: (String newValue) {
//             setState(() {
//               testResult = newValue;
//               print(testResult);
//             });
//           },
//           dropdownColor: grey2,
//           items: ['Choose','Negative','Positive']
//               .map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value,style:TextStyle(
//                 color:Colors.white,
//               )),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }