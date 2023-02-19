import 'package:flutter/material.dart';

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
