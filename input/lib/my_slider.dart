import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double pos=1;
  bool istrue =true;
  RangeValues range =RangeValues(10, 50);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            activeColor: Colors.yellow,
              thumbIcon: MaterialStatePropertyAll(Icon(Icons.dark_mode,color: Colors.white,)),
              thumbColor: MaterialStatePropertyAll(Colors.green),
              value: istrue, onChanged: (val){
              setState(() {
                istrue =val;
              });
          }),
          Center(
            child: Slider(
              secondaryTrackValue: pos,
              label: "$pos",
              divisions: 10,
              thumbColor: Colors.black,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              min: 0,
              max: 10,
              value: pos,onChanged: (val){
                pos=val;
                print(val);
                setState(() {

                });
            },),
          ),
    SizedBox(
    height: 100,
    ),
          RangeSlider(
              min: 10,
              max: 100,
              values: range, onChanged: (val){
                setState(() {
                  range=val;
                  print(range.start);
                });
          }),
          CupertinoSlider(value: pos, onChanged: (val){
            setState(() {
              pos=val;
            });
          })
        ],
      ),
    );
  }

}
