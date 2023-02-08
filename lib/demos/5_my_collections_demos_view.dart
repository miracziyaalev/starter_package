// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyCollectionDemos extends StatefulWidget {
  const MyCollectionDemos({super.key});

  @override
  State<MyCollectionDemos> createState() => _MyCollectionDemosState();
}

class _MyCollectionDemosState extends State<MyCollectionDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 510),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: SizedBox(
        height: StaticValues().cardHeight,
        child: Column(
          children: [
            Image.asset(_model.imagePath),
            Padding(
              padding: PaddingUtility().paddingHorizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_model.title, style: Theme.of(context).textTheme.headlineSmall),
                  Text(_model.price.toString(), style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;
  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class PaddingUtility {
  final EdgeInsets paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
  final EdgeInsets paddingBottom = const EdgeInsets.only(bottom: 40);
}

class StaticValues {
  final double cardHeight = 220;
}

class CollectionItems {
  late final List<CollectionModel> items;

  CollectionItems() {
    items = [
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art', price: 3.9),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art2', price: 3.1),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art3', price: 3.29),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art4', price: 3.4),
    ];
  }
}

class ProjectImages {
  static const imageCollection = 'assets/png/collections.png';
}


