import 'package:flutter/material.dart';

class ColorCartProvider extends ChangeNotifier {
  final List<Color> _cartColors = [];
  final List<Color> _colors = [
    Colors.yellow,
    Colors.orange,
    Colors.blue,
    Colors.pink,
    Colors.grey,
    Colors.green,
  ];

  List<Color> get colors => _colors;
  List<Color> get cartColors => _cartColors;

  addColorsToCart(Color color) {
    if (_cartColors.contains(color)) {
      _cartColors.remove(color);
    } else {
      _cartColors.add(color);
    }
    notifyListeners();
  }

  bool colorCartStatus(Color color) => _cartColors.contains(color);
}
