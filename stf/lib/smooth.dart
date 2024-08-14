import 'dart:math';

import 'package:flutter/material.dart';

class MySmooth extends StatefulWidget {
  const MySmooth({super.key});

  @override
  State<MySmooth> createState() => _MySmoothState();
}

class _MySmoothState extends State<MySmooth> {
  int len = 5;
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            direction: Axis.horizontal, children: List.generate(len, (index) => animeContainer(index, currIndex)),),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {
                if(currIndex==0){
                  setState(() {
                    currIndex = len-1;
                  });
                }else{
                  setState(() {
                    currIndex--;
                  });
                }
              }, icon: const Icon(Icons.arrow_back)),
              IconButton(
                  onPressed: () {
                    if(currIndex==len-1){
                      setState(() {
                        currIndex =0;
                      });
                    }else{
                      setState(() {
                        currIndex++;
                      });
                    }
                  }, icon: const Icon(Icons.arrow_forward))
            ],
          )
        ],
      ),
    );
  }

  Widget animeContainer(int index, int currIndex) {
    return Transform.rotate(
      angle: index == currIndex ? pi/6 : 0,
      child: AnimatedContainer(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: index == currIndex ? Border.all(color: Colors.green,width: 2,) : null,
          borderRadius: BorderRadius.circular(10)
        ),
        duration: Duration(milliseconds: 500),
        child: AnimatedContainer(
        margin: EdgeInsets.all(3),
        duration: const Duration(milliseconds: 500),
        height: index== currIndex ? 30 :  20,
        width: index == currIndex ? 30 : 20,
        decoration: BoxDecoration(
            color: index == currIndex ? Colors.green : Colors.red,
            // shape: BoxShape.circle
            borderRadius: index == currIndex ? BorderRadius.circular(12) : BorderRadius.circular(90)
        ),
      ),),
    );
  }
}
