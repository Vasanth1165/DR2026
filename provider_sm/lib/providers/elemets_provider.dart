import 'package:flutter/material.dart';

class ElementsProvider extends ChangeNotifier{
  bool _isDark = false;
  bool get isDark => _isDark;

  double _sliderVal = .5;
  double get sliderVal => _sliderVal;

  toggleTheme(){
    _isDark = !_isDark;
    notifyListeners();
  }

  changeOpacity(double val){
    _sliderVal  = val;
    notifyListeners();
  }
  
}