import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimeSwitch extends StatefulWidget {
  const AnimeSwitch({super.key});

  @override
  State<AnimeSwitch> createState() => _AnimeSwitchState();
}

class _AnimeSwitchState extends State<AnimeSwitch> {
  bool _isAlign = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isAlign = !_isAlign;
          });
        },
        child: const Icon(Icons.flip),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: 100,
            left: _isAlign ? 300 : 50,
            // right: _isAlign ? 50 : 300,
            // bottom: 100,
            // opacity: _isAlign ? 0.5: 1,
            // padding: EdgeInsets.symmetric(vertical: _isAlign ? 200 : 10),
            // alignment: _isAlign ? Alignment.bottomRight : Alignment.center,
            duration: const Duration(milliseconds: 500),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 60,
              width: 150,
              decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.grey.shade300,
                  border: Border.all(width: 2,color: Colors.black),
                  borderRadius: BorderRadius.circular(90)),
            ),
            btn()
          ],
        ),
      ),
    );
  }

  Widget btn() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      top: 5,
      bottom: 5,
      left: isDark ? 95 : 5,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isDark = !isDark;
          });
        },
        child: AnimatedContainer(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: isDark ? Colors.white : Colors.black,
              shape: BoxShape.circle),
          duration: const Duration(milliseconds: 500),
          child: AnimatedOpacity(
            opacity: 1,
            duration: const Duration(
              milliseconds: 300,
            ),
            child: Center(
              child: Icon(
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                color: isDark ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


