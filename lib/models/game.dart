import 'package:flutter/material.dart';

class Game extends ChangeNotifier {
  bool isV2 = false;

  void toggleVersion() {
    isV2 = !isV2;
    notifyListeners();
  }

  void reset() {
    isV2 = false;
    notifyListeners();
  }
}
