import 'package:flutter/material.dart';
import 'package:taskswithtopic/22A91A05A1.dart';
import 'package:taskswithtopic/22A91A05G8.dart';
import 'package:taskswithtopic/22MH1A0518.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks by roll")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>rowsandcolomns()));
                },
                child: const Text("22A91A05G8")
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TextWidget()));
                },
                child: const Text("22A91A05A1")
            ),
            SizedBox(height: 10,),
            // ElevatedButton(
            //     onPressed: (){
            //       Navigator.push(context, MaterialPageRoute(builder: (context)=>stringsex()));
            //     },
            //     child: const Text("22MH1A0518")
            // )
          ],
        ),
      ),
    );

  }
}
