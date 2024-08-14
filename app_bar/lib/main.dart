import 'dart:js';
import 'package:app_bar/class_flex.dart';
import 'package:app_bar/class_safearea.dart';
import 'package:app_bar/colors.dart';
import 'package:app_bar/grid.dart';
import 'package:app_bar/insta.dart';
import 'package:app_bar/onboarding.dart';
import 'package:app_bar/page.dart';
import 'package:app_bar/whatsapp_ui.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder:(context)=> MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: classSafe(),
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
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => const MyColors()));
          //     },
          //     child: const Text("colors")),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WhatsApp()));
              },
              child: const Text("WhatsApp")),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Insta()));
              },
              child: const Text("insta")),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=> const MyGrid()));
              },
              child: const Text("Grid")),
          const Spacer()
        ]));
  }

  
}


// ListView.builder()
// ListView.sperated()
