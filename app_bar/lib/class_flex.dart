import 'package:flutter/material.dart';

class MyClassFlex extends StatefulWidget {
  const MyClassFlex({super.key});

  @override
  State<MyClassFlex> createState() => _MyClassFlexState();
}

class _MyClassFlexState extends State<MyClassFlex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
          color: Colors.yellow,
            height: 100,
            width: double.infinity,
          ),
          Expanded(child: Container(
            child: Wrap(
              // direction: Axis.vertical,
              spacing: 20,
              runSpacing: 20,
              children: List.generate(10, (index) => Container(color: Colors.red,width: 100,height: 100,)),
            ),
          )),
          Container(
            color: Colors.orange,
            height: 100,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
