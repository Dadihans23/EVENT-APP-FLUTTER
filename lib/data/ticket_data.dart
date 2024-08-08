import 'package:flutter/material.dart';
import 'package:my_event_app/models/tycket_item.dart';

class tycketData extends ChangeNotifier {
  List<tycketItem> Alltycket = [];

  List<tycketItem> getAlltycket() {
    return Alltycket;
  }

  void addtycket(tycketItem tycket) {
    Alltycket.add(tycket);
    notifyListeners();
  }

  void deletetycket(tycketItem tycket) {
    Alltycket.remove(tycket);
    notifyListeners();
  }

  bool isEventFree() {
    return Alltycket.isEmpty;
  }

  void clearTycketData() {
    Alltycket.clear();
    notifyListeners();
  }
}
