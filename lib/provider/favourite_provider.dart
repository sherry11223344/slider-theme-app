import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  final List<int> _favitem = [];
  List<int> get favitem => _favitem;

  void additem(int value) {
    _favitem.add(value);
    notifyListeners();
  }

  void removeitem(int value) {
    _favitem.remove(value);
    notifyListeners();
  }
}
