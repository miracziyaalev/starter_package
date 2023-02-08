// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../core/random_image.dart';

class ListtileLearn extends StatelessWidget {
  const ListtileLearn({super.key});

  final imageUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  //kendi paddinglerini siler
                  dense: true,
                  onTap: () {},
                  title: const RandomImage(),
                  subtitle: const Text('How do you use your card'),
                  leading: Container(
                    height: 200,
                    width: 20,
                    alignment: Alignment.bottomCenter,
                    color: Colors.red,
                    child: const Icon(Icons.money),
                  ),
                  minVerticalPadding: 0,
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
