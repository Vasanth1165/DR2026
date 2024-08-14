import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardNew extends StatefulWidget {
  const CardNew({super.key});

  @override
  State<CardNew> createState() => _CardNewState();
}

class _CardNewState extends State<CardNew> {
  int tappedIndex = 0;
  final cardsColorsList = <Color>[Colors.red, Colors.orange, Colors.blue];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            child: Column(
              children: List.generate(cardsColorsList.length,
                  (index) => customCard(index, cardsColorsList[index])),
            ),
          ),
        ),
      ),
    );
  }

  Widget customCard(int index, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tappedIndex = index;
        });
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        duration: const Duration(seconds: 1),
        height: tappedIndex == index ? 200 : 55,
        width: double.infinity,
        
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(colors: [color,color]),
          boxShadow: [
            BoxShadow(
              color: color
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
