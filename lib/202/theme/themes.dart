import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  final _darkColor = _DarkThemeColor();

  late final ThemeData theme;

  DarkTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
            color: Colors.amber),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: _darkColor._floatingActionButtonColor),
        buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.dark(onPrimary: Colors.white)),
        textTheme:
            ThemeData.dark().textTheme.copyWith(bodyLarge: TextStyle(fontSize: 50, color: _darkColor._textColor)),
        colorScheme: const ColorScheme.dark(), //theme type
        checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all(Colors.blueGrey)));
  }
}

class LightTheme {
  final _lightColor = _LightThemeColor();

  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light(onPrimary: Colors.green)));
  }
}

class _DarkThemeColor {
  final Color _textColor = const Color.fromARGB(255, 208, 208, 208);
  final Color _floatingActionButtonColor = Colors.blueGrey;
}

class _LightThemeColor {
  final Color _textColor = const Color.fromARGB(255, 168, 81, 81);
  final Color _floatingActionButtonColor = const Color.fromARGB(255, 2, 13, 19);
}
