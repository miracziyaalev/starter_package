import 'package:flutter/material.dart';

class CallBackButtonDemos extends StatefulWidget {
  const CallBackButtonDemos({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<CallBackButtonDemos> createState() => _CallBackButtonDemosState();
}

class _CallBackButtonDemosState extends State<CallBackButtonDemos> {
  Color? _backgroundColor;
  bool isTapped = false;

  void _tapped() {
    isTapped = !isTapped;
    setState(() {});
  }

  void changeColor() {
    isTapped ? _backgroundColor = Colors.red : _backgroundColor = Colors.green;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _backgroundColor,
        ),
        onPressed: () {
          _tapped();
          changeColor();
          widget.onTap.call();
        },
        child: const Text('change'));
  }
}
