import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText = '❤';
  bool _isSecure = true;
  final String hintext = 'Passwod';

  void _changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintext,
        suffixIcon: _onVisibilityIcon(),
        //suffix: Icon(Icons.abc),
      ),
      obscureText: _isSecure,
      obscuringCharacter: _obscureText,
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: _changeSecure,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_off_outlined),
        secondChild: const Icon(Icons.visibility_outlined),
        crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 2),
      ),
      //icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
    );
  }
}
