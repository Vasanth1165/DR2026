import 'package:flutter/material.dart';
class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.tealAccent,
          ),
        ),
        title: Text("Vasanth"),
        subtitle: Text("Hello"),
        trailing: Text("03:00AM"),
      );
    });
  }
}
