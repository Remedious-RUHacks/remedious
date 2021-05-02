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


class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const CustomSwitch({Key key, this.value, this.onChanged, this.activeColor})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 50));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 50),
            width: 75.0,
            height: 35.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
                color: grey3,
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _circleAnimation.value == Alignment.centerRight
                        ? Container(
                      width:35,
                          child: Center(
                            child: Text(
                              'Y',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.0),
                            ),
                          ),
                        )
                        : Container(),
                    _circleAnimation.value == Alignment.centerRight?  Padding(
                      padding: const EdgeInsets.symmetric(horizontal:1.0),
                      child: Align(
                        alignment:Alignment.center,
                        child: Container(
                          width: 2,
                          height: 39,
                          color: Colors.black,
                        ),
                      ),
                    ):Container(),
                    Align(
                      alignment: _circleAnimation.value,
                      child: Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: blue1),
                        child: _circleAnimation.value == Alignment.centerLeft
                            ? Center(
                              child: Text(
                                'Y',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16.0),
                              ),
                            )
                            :Center(
                          child: Text(
                            'N',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ),
                        ) ,
                      ),
                    ),
                    _circleAnimation.value == Alignment.centerLeft?  Padding(
                          padding: const EdgeInsets.symmetric(horizontal:1.0),
                          child: Align(
                            alignment:Alignment.center,
                            child: Container(
                              width: 2,
                              height: 39,
                              color: Colors.black,
                            ),
                          ),
                        ):Container(),
                    _circleAnimation.value == Alignment.centerLeft
                        ? Container(
                      width:35,
                          child: Center(
                            child: Text(
                              'N',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.0),
                            ),
                          ),
                        )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
