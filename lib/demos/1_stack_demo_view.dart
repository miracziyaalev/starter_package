import 'package:flutter/material.dart';
import 'package:starter_package/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});

  final _cardHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    double dynamicWidth(double value) => MediaQuery.of(context).size.width * value;
    double dynamicHeight(double value) => MediaQuery.of(context).size.height * value;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(bottom: _cardHeight / 2, child: const RandomImage()),
                  Positioned(height: _cardHeight, width: dynamicWidth(0.5), bottom: 0, child: _cardCustom())
                ],
              )),
          const Spacer(flex: 6),
        ],
      ),
    );
  }

  Card _cardCustom() {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
