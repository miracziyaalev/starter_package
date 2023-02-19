import 'package:flutter/material.dart';

import '../../202/theme/themes.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTheme ? ThemeData.light() : DarkTheme().theme;
}
