import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    _loading = status;
    notifyListeners();
  }

  int _drawerIndex = 0;
  int get drawerInder => _drawerIndex;
  setDrawerIndex(int index) {
    _drawerIndex = index;
    notifyListeners();
  }
}
