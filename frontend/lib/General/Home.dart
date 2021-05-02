import 'package:flutter/material.dart';
import 'package:remedious/CommonWidgetMaker.dart';
import 'package:remedious/DataModels/GeneralUser.dart';
import 'package:remedious/styles.dart';

// ignore: must_be_immutable
class GeneralHome extends StatefulWidget {

  @override
  _GeneralHomeState createState() => _GeneralHomeState();
}

class _GeneralHomeState extends State<GeneralHome> {
  GeneralUser user;

  List<Widget> symptoms = [
    SizedBox(height: 60,),
    CircularProgressIndicator(),
  ];
  List<Widget> remedies = [
    SizedBox(height: 60,),
    CircularProgressIndicator(),
  ];

  TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
    user = ModalRoute.of(context).settings.arguments;
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    Future.delayed(Duration.zero, ()
    {
      makeSymptomList();
      makeRemediesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        color: bgColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              appBar2(context,user),
              SizedBox(height: 50,),
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
              SizedBox(height: 40,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: Column(
                    children: <Widget>[
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
                              image: AssetImage("images/SmileyNervous.webp"),
                            ),
                            SizedBox(width: 10,),
                            Text("Symptoms",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                            ),)
                          ],
                        ),
                      ),
                      SizedBox(height:15),
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: symptoms,
                        ),
                      ),
                      SizedBox(height:30),
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
                              image: AssetImage("images/Leaf.webp"),
                            ),
                            SizedBox(width: 10,),
                            Text("Remedies",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                            ),)
                          ],
                        ),
                      ),
                      SizedBox(height:15),
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: remedies,
                        ),
                      ),
                      SizedBox(height:30),
                    ],
                  ),
                ),
              ),
              bottomBar(context)
            ],
          ),
        ),
      ),
    );
  }

  void makeSymptomList() async {
    symptoms = <Widget>[];

    for (int i in [1,2,3,4,5]){
      symptoms.add( Container(
        height:50,
        width: MediaQuery.of(context).size.width*0.6,
        decoration: BoxDecoration(
            color:grey2,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          height:42,
          width: MediaQuery.of(context).size.width*0.6-40,
          child: Center(
            child: Row(
              children: <Widget>[
                SizedBox(width:30),
                Text("Lung scarring",style: TextStyle(
                    color: Colors.white
                ),),
                Spacer(),
                InkWell(
                  onTap: (){},
                  child: Text("Update",style: TextStyle(
                      color: blue1,
                      fontSize: 14
                  ),),
                ),
                SizedBox(width:30),
                Icon(Icons.more_vert,color:blue1),
                SizedBox(width:20),
              ],
            ),
          ),
        ),
      ));
        symptoms.add(SizedBox(height:30));
    }
    setState(() { });
  }
  void makeRemediesList() async {
    remedies = <Widget>[];

    for (int i in [1,2,3,4,5]){
      remedies.add( Container(
        height:50,
        width: MediaQuery.of(context).size.width*0.6,
        decoration: BoxDecoration(
            color:grey2,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          height:42,
          width: MediaQuery.of(context).size.width*0.6-40,
          child: Center(
            child: Row(
              children: <Widget>[
                SizedBox(width:30),
                Text("Green tea",style: TextStyle(
                    color: Colors.white
                ),),
                Spacer(),
                InkWell(
                  onTap: (){},
                  child: Text("Update",style: TextStyle(
                      color: blue1,
                      fontSize: 14
                  ),),
                ),
                SizedBox(width:30),
                Icon(Icons.more_vert,color:blue1),
                SizedBox(width:20),
              ],
            ),
          ),
        ),
      ));
        remedies.add(SizedBox(height:30));
    }
    setState(() { });
  }
}
