// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_package/product/global/resource_context.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().clear();
              },
              icon: const Icon(Icons.remove))
        ],
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ""),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: 400,
            child: PngImage(name: ImageItems().notFound),
          )
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleBook = "assets/appleBook.png";
  final String notFound = "notFound.png";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.cover);
  }

  String get _nameWithPath => "assets/png/$name";
}
