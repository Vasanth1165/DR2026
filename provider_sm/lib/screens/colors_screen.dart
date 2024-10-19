import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/providers/color_cart_provider.dart';
import 'package:provider_sm/screens/colors_cart_screen.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COLORS"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColorsCartScreen()));
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Consumer<ColorCartProvider>(
        builder: (context, value, child) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: value.colors[index],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        value.addColorsToCart(value.colors[index]);
                      },
                      icon: Icon(
                        value.colorCartStatus(value.colors[index])
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ))
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
            itemCount: value.colors.length),
      ),
    );
  }
}
