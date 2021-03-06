import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/DataModels/GeneralUser.dart';
import 'package:remedious/DataModels/Symptom&Remedy.dart';
import 'package:remedious/styles.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

class AcademicSignUp extends StatefulWidget {
  @override
  _AcademicSignUpState createState() => _AcademicSignUpState();
}

class _AcademicSignUpState extends State<AcademicSignUp> {

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

  ScrollController controller1 = ScrollController();

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
        child: SmoothScrollWeb(
          controller: controller1,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller1,
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
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, generalSignUpRoute);
                          },
                          child: Text("General",style: TextStyle(
                              color: Colors.white
                          ),),
                        ),
                        SizedBox(height:7),
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
                        Text("Academic",style: TextStyle(
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
                          labelText: 'Institutional Email Address',
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
                  onTap: () async {

                    if (passController.text!=confirmPassController.text){
                      // Fluttertoast.showToast(msg: "The passwords do not match");
                      return;
                    }

                    // Response response = await post(baseURL+"signup",body: {"email":emailController.text,"password":passController.text,"firstname":firstName.text,"lastname":lastName.text},headers: {"Access-Control-Allow-Origin":"http://localhost:56833/",'Access-Control-Allow-Credentials':'true'});
                    // print(response.body);

                    Navigator.pushNamed(context, academicHomeRoute, arguments: GeneralUser(firstName: "Sid",lastName: "Aggy",email: emailController.text,password: passController.text,symptoms: <Symptom>[Symptom("A high temperature")]));
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
                            recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, academicLoginRoute),
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
      ),
    );
  }
}
