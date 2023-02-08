import 'package:flutter/material.dart';
import 'package:starter_package/product/counter_hello_buton.dart';
import 'package:starter_package/product/language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _counter = 0;

  final int _counterCustom = 0;

  final String _welcomeTitle = LanguageItems.welcomeTitle;

  void updateCounter(bool isIncrement) {
    isIncrement == true ? _counter++ : _counter--;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_welcomeTitle),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              _counter.toString(),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.blueGrey),
            ),
          ),
          const Placeholder(),
          const CounterHelloButton(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    print("burada");

    return FloatingActionButton(
      onPressed: () {
        updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          updateCounter(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
