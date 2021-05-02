import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/styles.dart';

class GeneralSignUp extends StatefulWidget {
  @override
  _GeneralSignUpState createState() => _GeneralSignUpState();
}

class _GeneralSignUpState extends State<GeneralSignUp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();

  @override
  void initState(){
    super.initState();
    myFocusNode.addListener(() {setState(() {});});
    myFocusNode2.addListener(() {setState(() {});});
    myFocusNode3.addListener(() {setState(() {});});
    myFocusNode4.addListener(() {setState(() {});});
    myFocusNode5.addListener(() {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              appBar(context),
              SizedBox(height:30),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("General",style: TextStyle(
                          color: blue1
                      ),),
                      SizedBox(height:5),
                      Container(
                        width: 70,
                        height: 2,
                        color: blue1,
                      )
                    ],
                  ),
                  SizedBox(width: 10,),
                  Container(
                      width: 2,
                      height: 50,
                      color: Colors.white
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, academicSignUpRoute);
                        },
                        child: Text("Academic",style: TextStyle(
                            color: Colors.white
                        ),),
                      ),
                      SizedBox(height:7),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text("Sign up for a free account",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 58,
                    width: 160,
                    decoration: BoxDecoration(
                        color: grey2,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: firstName,
                          focusNode: myFocusNode,
                          autofillHints: [AutofillHints.name],
                          keyboardType: TextInputType.name,
                          style: TextStyle(color:Colors.white,fontSize: 14),
                          decoration: InputDecoration(
                            labelText: 'First name',
                            // hintText: 'Email Address',
                            labelStyle: TextStyle(color:myFocusNode.hasFocus? blue1:Colors.white,fontSize: 14),
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
                  SizedBox(width:30),
                  Container(
                    height: 58,
                    width: 160,
                    decoration: BoxDecoration(
                        color: grey2,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: lastName,
                          focusNode: myFocusNode2,
                          autofillHints: [AutofillHints.name],
                          keyboardType: TextInputType.name,
                          style: TextStyle(color:Colors.white,fontSize: 14),
                          decoration: InputDecoration(
                            labelText: 'Last name',
                            // hintText: 'Email Address',
                            labelStyle: TextStyle(color:myFocusNode2.hasFocus? blue1:Colors.white,fontSize: 14),
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
              SizedBox(height: 30,),
              Container(
                height: 58,
                width: 350,
                decoration: BoxDecoration(
                    color: grey2,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: emailController,
                      focusNode: myFocusNode3,
                      autofillHints: [AutofillHints.email],
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color:Colors.white,fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        // hintText: 'Email Address',
                        labelStyle: TextStyle(color:myFocusNode3.hasFocus? blue1:Colors.white,fontSize: 14),
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
              SizedBox(height: 30,),
              Container(
                height: 58,
                width: 350,
                decoration: BoxDecoration(
                    color: grey2,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                    child: TextFormField(
                      controller: passController,
                      focusNode: myFocusNode4,
                      obscureText: true,
                      autofillHints: [AutofillHints.password],
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color:Colors.white,fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        // hintText: 'Email Address',
                        labelStyle: TextStyle(color:myFocusNode4.hasFocus? blue1:Colors.white,fontSize: 14),
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
              SizedBox(height: 30,),
              Container(
                height: 58,
                width: 350,
                decoration: BoxDecoration(
                    color: grey2,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                    child: TextFormField(
                      controller: confirmPassController,
                      focusNode: myFocusNode5,
                      obscureText: true,
                      autofillHints: [AutofillHints.password],
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color:Colors.white,fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        // hintText: 'Email Address',
                        labelStyle: TextStyle(color:myFocusNode5.hasFocus? blue1:Colors.white,fontSize: 14),
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
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, onboardingRoute);
                },
                child: Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                      color:blue1,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(
                    child: Text("Register",style: TextStyle(
                        fontSize: 18
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              RichText(
                  text: TextSpan(
                  style: TextStyle(color:Colors.white,fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Have an account? Sign in ",
                    ),
                    TextSpan(
                        text: "Here",
                          recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, generalLoginRoute),
                        style: TextStyle(
                            color: blue1,
                            fontSize: 16
                        )
                    )
                  ]
              )),
              SizedBox(height:20),
              bottomBar(context),
            ],
          ),
        ),
      ),
    );
  }
}
