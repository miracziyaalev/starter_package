import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_package/product/global/resource_context.dart';
import 'package:starter_package/product/global/theme_notifer.dart';

import '303/learn/5_lottie_learn.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => ResourceContext()),
      ChangeNotifierProvider(create: (context) => ThemeNotifer())
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifer>().currentTheme,

      // ThemeData.dark().copyWith(
      //     appBarTheme: const AppBarTheme(
      //       centerTitle: true,
      //       backgroundColor: Colors.transparent,
      //       actionsIconTheme: IconThemeData(size: 30),
      //       systemOverlayStyle: SystemUiOverlayStyle.light,
      //       elevation: 0,
      //       titleTextStyle: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 24,
      //         color: Colors.blueGrey,
      //       ),
      //     ),
      //     iconTheme: const IconThemeData().copyWith(
      //       color: Theme.of(context).colorScheme.background,
      //     ),
      //     inputDecorationTheme: const InputDecorationTheme(
      //       border: OutlineInputBorder(),
      //       iconColor: Colors.blueGrey,
      //     ),
      //     cardTheme: CardTheme(
      //         elevation: 5,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(20),
      //         )),
      //     progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.red),
      //     //listTile temalarimin paddinglerini 0a cektim
      //     listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //     tabBarTheme: const TabBarTheme(
      //       labelColor: Colors.blueGrey,
      //       unselectedLabelColor: Colors.white,
      //       indicatorColor: Colors.white,
      //       //indicatorSize: TabBarIndicatorSize.label,
      //     ),
      //     bottomAppBarTheme: const BottomAppBarTheme(
      //       shape: CircularNotchedRectangle(),
      //     )),
      debugShowCheckedModeBanner: false,
      home: const LottieLearn(),
    );
  }
}
