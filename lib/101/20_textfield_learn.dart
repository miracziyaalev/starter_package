import 'package:flutter/material.dart';
import 'package:starter_package/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        maxLength: 20,
        buildCounter: (context, {int? currentLength, bool? isFocused, int? maxLength}) {
          return _customAnimatedContainer(currentLength);
        },
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        //sonraki textfielda gider
        //textInputAction: TextInputAction.next,
        //inputformatters package
        decoration: _InputDecorator().emailInput,
      ),
    );
  }

  AnimatedContainer _customAnimatedContainer(int? currentLength) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      color: Colors.green[100 * (currentLength ?? 0)],
      height: 10,
      width: 50.0 * (currentLength ?? 0.0),
    );
  }
}

class _InputDecorator {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mailText,
    filled: true,
  );
}
