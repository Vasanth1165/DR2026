import 'package:flutter/material.dart';

class MQuery extends StatefulWidget {
  const MQuery({super.key});

  @override
  State<MQuery> createState() => _MQueryState();
}

class _MQueryState extends State<MQuery> {

  double? hi;
  double? wi;

  @override
  Widget build(BuildContext context) {
    hi=MediaQuery.sizeOf(context).height;
    wi=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Text("${wi!.toInt()} X ${hi!.toInt()}",style: TextStyle(fontSize: 48),),
      ),
    );
  }
}
