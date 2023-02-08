import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(child: FlutterLogo()),
          Expanded(child: FlutterLogo()),
          Expanded(child: FlutterLogo()),
          Expanded(child: FlutterLogo()),
        ],
      ),
    );
  }
}
