import 'package:basic_app/card_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardNew());
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.purple,
                ),
              ),
              const Expanded(flex: 3, child: SizedBox())
            ],
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        color: Colors.orange,
                      ),
                      Positioned(
                          top: -50,
                          left: (MediaQuery.sizeOf(context).width-100) / 2,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration:
                                const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Text("Hello"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                          10,
                          (index) => Container(
                                width: 150,
                                height: 200,
                                margin: const EdgeInsets.only(right: 20),
                                color: Colors.grey,
                              ))),
                ),
                Column(
                  children: List.generate(
                          10,
                          (index) => Container(
                                width: double.infinity,
                                height: 200,
                                margin: const EdgeInsets.all(20),
                                color: Colors.grey,
                              ))),
              ],
            )),
          )
        ],
      ),
    );
  }
}
