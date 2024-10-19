import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/providers/theme_provider.dart';
import 'package:provider_sm/screens/colors_screen.dart';
import 'package:provider_sm/screens/counter_screen.dart';
import 'package:provider_sm/screens/elements_screen.dart';
import 'package:provider_sm/screens/postion_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
            child: const Text("elements")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ColorsScreen()));
            },
            child: const Text("colors")),
        Consumer<ThemeProvider>(
          builder: (context, value, child) => CupertinoSwitch(
              value: value.theme == ThemeMode.dark ? true : false,
              onChanged: (val) {
                value.changeTheme(val ? ThemeMode.dark : ThemeMode.light);
              }),
        )
      ]),
    );
  }
}
