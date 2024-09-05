import 'package:flutter/material.dart';

class rowsandcolomns extends StatelessWidget {
  const rowsandcolomns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("data1"),
          Text("data2"),
          Text("data3"),
          Row(
            children: [
              Text("data1"),
              Text("data2"),
              Text("data3")
            ],
          )
        ],
      ),
    );
  }
}
