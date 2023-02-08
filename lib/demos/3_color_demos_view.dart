// ignore_for_file: public_member_api_docs, sort_constructors_first
//ekranda 3 button olacak. bunlara basinda renk degisecek
//secili butonlar selected icon

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({
    Key? key,
    required this.initialColor,
  }) : super(key: key);
  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backroundColor;

  @override
  void initState() {
    super.initState();
    _backroundColor = widget.initialColor ?? Colors.blueGrey;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialColor != _backroundColor) {
      changeBackroundColor(widget.initialColor!);
    }
  }

  void changeBackroundColor(Color color) {
    setState(() {
      _backroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _colorOnTap,
        items: const [
          BottomNavigationBarItem(icon: _ColorContainer(selectedColor: Colors.red), label: 'Red'),
          BottomNavigationBarItem(icon: _ColorContainer(selectedColor: Colors.yellow), label: 'Yellow'),
          BottomNavigationBarItem(icon: _ColorContainer(selectedColor: Colors.blue), label: 'Blue'),
        ],
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackroundColor(Colors.yellow);
    } else {
      changeBackroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.selectedColor,
  }) : super(key: key);
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(width: 10, height: 10, color: selectedColor);
  }
}
