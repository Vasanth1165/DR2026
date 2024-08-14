import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp(),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner:false,home: pavan(),);
  }
}
class pavan extends StatefulWidget {
  const pavan({super.key});

  @override
  State<pavan> createState() => _pavanState();
}

class _pavanState extends State<pavan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:30,
      decoration:  BoxDecoration(color: Colors.blue[300],
      borderRadius: const BorderRadius.all(Radius.circular(20),
      ),
      ),
    );
  }
}