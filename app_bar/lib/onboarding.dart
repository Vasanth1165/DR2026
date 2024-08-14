import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentboard = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: PageView(
              onPageChanged: (val) {
                setState(() {
                  currentboard = val;
                });
              },
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.lightBlue,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          dotIndicator(currentboard, 3)
        ],
      ),
    ));
  }
    Widget dotIndicator(int currentIndex, int length) {
    return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            length,
            (index) => AnimatedContainer(
                  width: index == currentIndex ? 100 : 50,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: index == currentIndex ? Colors.red : Colors.grey),
                  duration: const Duration(milliseconds: 500),
                )));
  }
}
