import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/styles.dart';

class Landing extends StatelessWidget {
  final String route = '/landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: bgGradient
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30,top: 30),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, generalLoginRoute);
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              height:100,
                              fit: BoxFit.fitHeight,
                              image:AssetImage("images/Logo.png")
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Remedious",style: GoogleFonts.norican().merge(TextStyle(fontSize:33,color:Colors.white)),),
                                Text("Evidence-based remedies",style:TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height:30),
                      Container(
                        child: Text("Are you suffering from long Covid? Are you following home remedies that worked for you? Are you interested in contributing to scientific and medical research?",maxLines: null,style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                      SizedBox(height:30),
                      Container(
                        child: Row(
                          children: [
                            Text("Be a part of our community",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(height:30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 45,
                            width:160,
                            decoration: BoxDecoration(
                              color: blue1,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(child: Text("Register")),
                          ),
                          Container(
                            height: 45,
                            width:160,
                            decoration: BoxDecoration(
                                color: grey1,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(child: Text("Know More")),

                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Image(
                  image: AssetImage("images/SideImage.webp"),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }
}
