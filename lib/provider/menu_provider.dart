import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  String _selectedMenuItem = '';

  String get selectedMenuItem => _selectedMenuItem;

  void setSelectedMenuItem(String menuItem) {
    _selectedMenuItem = menuItem;
    notifyListeners(); // Notify listeners when the selected menu item changes
  }
}
