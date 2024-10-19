import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _theme = ThemeMode.light;
  ThemeMode get theme => _theme;

  changeTheme(ThemeMode mode){
    _theme = mode;
    notifyListeners();
  }
}