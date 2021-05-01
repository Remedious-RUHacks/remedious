import 'package:flutter/material.dart';
import 'package:remedious/styles.dart';

Widget bottomBar(context){
  return Container(
    height:40,
    color: Colors.black,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: Container(
        height:40,
        width: MediaQuery.of(context).size.width*0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Site map",style: TextStyle(
              color: Colors.white,
              fontSize: 12
            ),),
            Text("Terms",style: TextStyle(
              color: Colors.white,
                fontSize: 12
            ),),
            Text("Privacy",style: TextStyle(
              color: Colors.white,
                fontSize: 12
            ),),
            Text("Contact us",style: TextStyle(
              color: Colors.white,
                fontSize: 12
            ),),
            Text("About us",style: TextStyle(
              color: Colors.white,
                fontSize: 12
            ),),

          ],
        ),
      ),
    ),
  );
}

Widget appBar(context){
  return Container(
    height:40,
    width: MediaQuery.of(context).size.width,
    color: Colors.black,
    child: Row(
      children: <Widget>[
        SizedBox(width:30),
        Image(
          image: AssetImage('images/Logo.png'),
        )
      ],
    ),
  );
}
//
// Widget textField(controller,labelText,String autoFillHints,Function setState,{width = 350}){
//   FocusNode myFocusNode = FocusNode();
//   myFocusNode.addListener(() {setState();});
//   return Container(
//     height: 58,
//     width: width,
//     decoration: BoxDecoration(
//         color: grey2,
//         borderRadius: BorderRadius.circular(10)
//     ),
//     child: Center(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
//         child: TextFormField(
//           controller: controller,
//           focusNode: myFocusNode,
//           obscureText: true,
//           autofillHints: [autoFillHints],
//           style: TextStyle(color:Colors.white,fontSize: 14),
//           decoration: InputDecoration(
//             labelText: labelText,
//             // hintText: 'Email Address',
//             labelStyle: TextStyle(color:myFocusNode.hasFocus? blue1:Colors.white,fontSize: 14),
//             border:null,
//             enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
//                 color: Color.fromRGBO(0,0,0,0)
//             )),
//             focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
//                 color: Color.fromRGBO(0,0,0,0)
//             )),
//           ),
//         ),
//       ),
//     ),
//   );
// }