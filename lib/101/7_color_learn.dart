import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  ColorLearn({super.key});

  ColorsItems colorsItems = ColorsItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(
          'data',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: colorsItems.sulu,
              ),
        ),
      ),
    );
  }
}

class ColorsItems {
  final Color porsche = const Color(0xffEDBF61);

  final Color sulu = const Color.fromRGBO(198, 237, 97, 1);

  final Color blueGrey = Colors.blueGrey;
}
