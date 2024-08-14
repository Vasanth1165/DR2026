import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(context){
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.red,
                width: 300,
                height: 300,
              ),
              Positioned(
                bottom: -100,
                right: -100,
                child: Container(
                  color: Colors.yellow,
                  width: 200,
                  height: 200,

                ),
              ),
              Positioned(
                left: 100,
                child: Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
