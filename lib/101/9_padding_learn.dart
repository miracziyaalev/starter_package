// ignore: file_names
import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: Container(color: Colors.white, height: 200)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                color: Colors.white,
                height: 200,
                padding: ProjectPadding.pagePaddingRightOnly,
               ),
            ),
            Padding(
              padding: ProjectPadding.pagePaddingRightOnly + ProjectPadding.pagePaddingVertical,
              child: const Text('Ali'),
            ),
          ],
        ),
      ),
    );
  }
}

SizedBox _emptyBox() => const SizedBox(height: 10);

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 20);
  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
}
