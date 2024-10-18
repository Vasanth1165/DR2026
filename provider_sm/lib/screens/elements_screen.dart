import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/providers/elemets_provider.dart';

class ElementsScreen extends StatelessWidget {
  const ElementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building the screen");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: const Text(
              "Dark Mode",
              style: TextStyle(color: Colors.black),
            ),
            trailing:
                Consumer<ElementsProvider>(builder: (context, provider, child) {
              return CupertinoSwitch(
                  value: provider.isDark,
                  onChanged: (val) {
                    provider.toggleTheme();
                  });
            }),
          ),
          Consumer<ElementsProvider>(builder: (context, provider, child) {
            return Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(provider.sliderVal),
                  borderRadius:
                      BorderRadius.circular(200 * provider.sliderVal)),
            );
          }),
          Consumer<ElementsProvider>(builder: (context, provider, child) {
            return Slider(
                value: provider.sliderVal,
                onChanged: (val) {
                  provider.changeOpacity(val);
                });
          })
        ],
      ),
    );
  }
}
