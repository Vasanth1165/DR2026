import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/providers/color_cart_provider.dart';

class ColorsCartScreen extends StatelessWidget {
  const ColorsCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ColorCartProvider>(
        builder: (context, value, child) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: value.cartColors[index],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        value.addColorsToCart(value.cartColors[index]);
                      },
                      icon: Icon(
                        value.colorCartStatus(value.cartColors[index])
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
            itemCount: value.cartColors.length),
      ),
    );
  }
}
