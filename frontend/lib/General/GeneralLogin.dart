import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/DataModels/GeneralUser.dart';
import 'package:remedious/DataModels/Symptom&Remedy.dart';
import 'package:remedious/styles.dart';
import 'package:http/http.dart';

class GeneralLogin extends StatefulWidget {
  @override
  _GeneralLoginState createState() => _GeneralLoginState();
}

class _GeneralLoginState extends State<GeneralLogin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();

  bool _showPassword = true;
  @override
  void initState(){
     super.initState();
     myFocusNode.addListener(() {setState(() {});});
     myFocusNode2.addListener(() {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        child: Stack(
          children: [
            Column(
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
                            Navigator.pushNamed(context, academicLoginRoute);
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
                SizedBox(height: 50,),
                Text("Sign In",style: TextStyle(
                    color: Colors.white,
                  fontSize: 18
                ),),
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
                        focusNode: myFocusNode,
                        autofillHints: [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color:Colors.white,fontSize: 14),
                        decoration: InputDecoration(
                          labelText: 'Email Address',
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
                        focusNode: myFocusNode2,
                        obscureText: _showPassword,
                        autofillHints: [AutofillHints.password],
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color:Colors.white,fontSize: 14),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: InkWell(
                            onTap: _togglePasswordVisibility,
                            child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
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
                SizedBox(height:30),
                InkWell(
                  onTap: () async {

                    Response response = await post(baseURL+"login",body: {"email":emailController.text,"password":passController.text},headers: {"Access-Control-Allow-Origin":"http://localhost:56833/",'Access-Control-Allow-Credentials':'true'});
                    print(response.body);
                    Navigator.pushNamed(context, generalHomeRoute,arguments: GeneralUser(firstName: "Sid",lastName: "Aggy",email: emailController.text,password: passController.text,symptoms: <Symptom>[Symptom("A high temperature")]));
                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                        color:blue1,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Text("Log in",style: TextStyle(
                          fontSize: 18
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                RichText(text: TextSpan(
                  style: TextStyle(color:Colors.white,fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text:"Don't have an account? Sign up ",
                    ),
                    TextSpan(
                      text: "Here",
                        recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, generalSignUpRoute),
                        style: TextStyle(
                        color: blue1,
                        fontSize: 16
                      )
                    )
                  ]
                )),
                SizedBox(height:20),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:bottomBar(context),
            )
          ],
        ),
      ),
    );
  }
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
      // passwordController.value = TextEditingValue(text: password);
      // emailController.value = TextEditingValue(text: email);
    });
  }
}
