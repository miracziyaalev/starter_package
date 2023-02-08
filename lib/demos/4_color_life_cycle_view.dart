import 'package:flutter/material.dart';
import 'package:starter_package/demos/3_color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _changeBackround, icon: const Icon(Icons.clear))],
      ),
      body: Column(
        children: [const Spacer(), Expanded(child: ColorDemos(initialColor: _backroundColor))],
      ),
    );
  }

  void _changeBackround() {
    setState(() {
      _backroundColor = Colors.pink;
    });
  }
}
