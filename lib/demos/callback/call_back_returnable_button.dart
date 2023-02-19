import 'dart:math';

import 'package:flutter/material.dart';

class CallBackReturnableButton extends StatefulWidget {
  const CallBackReturnableButton({super.key, this.onPressed});

  final bool Function(int number)? onPressed;

  @override
  State<CallBackReturnableButton> createState() => _CallBackReturnableButtonState();
}

class _CallBackReturnableButtonState extends State<CallBackReturnableButton> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final result = Random().nextInt(10);

          final response = widget.onPressed?.call(result);

          if (response != null) {
            _backgroundColor = response ? Colors.green : Colors.red;
            print(result);
            setState(() {});
          }
        },
        style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
        child: const Text('Random number'));
  }
}
