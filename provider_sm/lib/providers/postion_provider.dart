import 'package:flutter/cupertino.dart';


class PostionProvider extends ChangeNotifier{
  int _items =0;
  int get items=> _items;

  void add(){
    _items++;
    notifyListeners();
  }
}