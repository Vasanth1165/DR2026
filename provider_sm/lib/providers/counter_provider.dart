
import 'package:flutter/foundation.dart';


class CounterProvider extends ChangeNotifier{
  int _count =0;
  int get count => _count;

  void inc(){
    _count = _count +1;
    notifyListeners();
  }

  void dec(){
    _count--;
    notifyListeners();
  }

  void reset(){
    _count =0;
    notifyListeners();
  }

}