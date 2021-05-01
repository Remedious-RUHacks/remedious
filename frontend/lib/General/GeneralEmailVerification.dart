import 'package:flutter/material.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/styles.dart';

class GeneralEmailVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Email verification sent! Please check your email.",style: TextStyle(color: Colors.white),),
                  SizedBox(height:30),
                  InkWell(
                    onTap: (){
                    },
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color:blue1,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Text("Resend Email Verification",style: TextStyle(
                            fontSize: 18
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height:40),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Text("Return to sign up page",style: TextStyle(color: blue1,fontSize: 14),)
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
                child: appBar(context)
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: bottomBar(context)
            ),
          ],
        ),
      ),
    );
  }
}
