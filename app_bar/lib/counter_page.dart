import 'package:flutter/material.dart';

class Counter  extends StatefulWidget{
  Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter =0;

  @override
  Widget build(BuildContext context) {
    debugPrint("build $counter");
    return Scaffold(
      body: Center(
        child: Text("$counter",
          style: TextStyle(fontSize: 128),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: (){
            increment();
          },child: Icon(Icons.add),),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(onPressed: (){
            decrement();
          },child: Icon(Icons.remove),)
        ],
      ),
    );
  }

  increment(){
    counter++;
    debugPrint("on increment $counter");
    setState(() {

    });
  }

  decrement(){
    counter--;
    debugPrint("on decrement $counter");
    setState(() {

    });
  }
}

