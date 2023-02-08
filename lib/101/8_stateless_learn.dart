// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:starter_package/101/7_color_learn.dart';

class StatelessLearn extends StatelessWidget {
  StatelessLearn({super.key});

  ColorsItems color = ColorsItems();

  final String text1 = 'a';
  final String text2 = 'b';
  final String text3 = 'c';
  final String text4 = 'd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget Learn'),
      ),
      body: Column(
        children: [
          TitleTextWidget(titleText: text1, colors: color.porsche),
          _emptyBox(),
          TitleTextWidget(titleText: text2, colors: color.blueGrey),
          _emptyBox(),
          TitleTextWidget(titleText: text3, colors: color.porsche),
          _emptyBox(),
          TitleTextWidget(titleText: text4, colors: color.blueGrey),
          _emptyBox(),
          const _CustomContainer(),
          _emptyBox(),
        ],
      ),
    );
  }

  SizedBox _emptyBox() => const SizedBox(height: 10);
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.titleText, required this.colors}) : super(key: key);

  final String titleText;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: colors),
    );
  }
}
