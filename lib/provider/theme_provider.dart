import 'package:cryptocurrency_app/local_storage/all_local_storage.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

// putting value into String....
  ThemeProvider(String theme) {
    if (theme == 'light') {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }
  // Switching theme by clicking.....
  void toggleTheme() async {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      await LocalStorage.saveTheme('dark');
    } else {
      themeMode = ThemeMode.light;
      await LocalStorage.saveTheme('light');
    }
    notifyListeners();
  }
}
