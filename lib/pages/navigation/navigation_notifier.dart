import 'package:flutter/material.dart';

class NavigationNotifier extends ChangeNotifier {
  int _index = 2;

  int getIndex() {
    return _index;
  }

  void setIndex(int payload) {
    _index = payload;
    notifyListeners();
  }
}
