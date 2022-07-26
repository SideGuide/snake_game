import 'package:flutter/material.dart';

class RouteService extends ChangeNotifier {
  int navigateTo = -1; // 0 menu, 1 store,

  navigate(int i) {
    navigateTo = i;
    notifyListeners();
  }
}
