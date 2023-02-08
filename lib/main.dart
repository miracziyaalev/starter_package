import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '101/21_list_view_learn.dart';
import '101/22_list_view_builder.dart';
import '101/23_navigation_learn.dart';
import 'demos/5_my_collections_demos_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actionsIconTheme: IconThemeData(size: 30),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.blueGrey,
            ),
          ),
          iconTheme: const IconThemeData().copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            iconColor: Colors.blueGrey,
          ),
          cardTheme: CardTheme(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.red),
          //listTile temalarimin paddinglerini 0a cektim
          listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero)),
      debugShowCheckedModeBanner: false,
      home: const NavigationLearn(),
    );
  }
}
