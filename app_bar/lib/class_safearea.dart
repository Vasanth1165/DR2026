import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class classSafe extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      // top: false,
      //   bottom: false,
      //   left: false,
      //   right: false,
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(

          ),
        )
    );
  }
}