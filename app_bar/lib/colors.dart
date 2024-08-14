import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGradient extends StatelessWidget{
  MyGradient({super.key});

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Color(0xffffbb00)
          // color: Color.fromARGB(255, 0, 0, 255)
          // color: Color.fromRGBO(162, 215, 255, 1)
          // color: Colors.red
          // color: CupertinoColors.activeGreen
          gradient: RadialGradient(
              // stops: [0,0,.9],
            // begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            center: Alignment.topLeft,
              colors: [Color(0xff008737),Color(0xffffbb00),Color(0xff72bd20)])
        ),
      ),
    );
  }
}