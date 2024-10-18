import 'package:flutter/material.dart';
import 'package:provider_sm/screens/counter_screen.dart';
import 'package:provider_sm/screens/elements_screen.dart';
import 'package:provider_sm/screens/postion_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CounterScreen()));
              },
              child: const Text("Counter")),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PostionScreen()));
            },
            child: const Text("postion")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ElementsScreen()));
            },
            child: const Text("elements"))
      ]),
    );
  }
}
