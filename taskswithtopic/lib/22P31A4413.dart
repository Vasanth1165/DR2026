import 'package:flutter/material.dart';
class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Flutter",style: Theme.of(context).textTheme.headlineLarge,),
      ),
    );
    

  }
}