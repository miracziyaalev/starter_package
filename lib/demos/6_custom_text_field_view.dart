import 'package:flutter/material.dart';

import '../product/password_text_field.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: const [
        PasswordTextField(),
      ]),
    );
  }
}
 