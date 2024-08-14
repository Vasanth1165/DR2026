import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.builder(
            itemCount: 30,
            padding: const EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.sizeOf(context).width <= 550
                    ? 2
                    : MediaQuery.sizeOf(context).width <= 1000
                        ? 3
                        : 4,
                mainAxisSpacing:
                    MediaQuery.of(context).size.width >= 550 ? 40 : 20,
                crossAxisSpacing: 20),
            itemBuilder: (context, ind) {
              return Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 100,
                ),
                foregroundDecoration: const BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage("")
                  ),
                  shape: BoxShape.circle
                ),
                decoration: const BoxDecoration(
                  color: Colors.yellow
                ),
              );
            }));
  }
}

// GridView(
// padding: EdgeInsets.all(20),
// scrollDirection: Axis.horizontal,
// reverse: true,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 20,
// crossAxisSpacing: 20,
// mainAxisExtent: 100,
//
// ),
// children: List.filled(3, Container(color: Colors.red,)),
// ),

// GridView.builder()
