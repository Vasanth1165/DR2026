import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';

void main(){
  // runApp(MyApp());
  runApp(DevicePreview(builder:(context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 30),
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(90)
          ),
          child: Row(
            children: [
              Icon(Icons.home),
              Spacer(),
              Icon(Icons.event),
              Spacer(),
              Icon(Icons.person)
            ],
          ),
        ),
      ),
    );
  }
}


