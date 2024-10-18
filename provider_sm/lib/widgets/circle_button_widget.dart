import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final Color color;
  final IconData icon;
  const CircleButton({super.key,
    required this.onTap,
    required this.icon,
    this.color = Colors.blue,
    this.size = 50
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
