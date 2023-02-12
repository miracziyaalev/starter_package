import 'package:flutter/material.dart';

class ImageLearn2020 extends StatefulWidget {
  const ImageLearn2020({super.key});

  @override
  State<ImageLearn2020> createState() => _ImageLearn2020State();
}

class _ImageLearn2020State extends State<ImageLearn2020> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.collections.toWidget(),
    );
  }
}

enum ImagePaths { collections }

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 240}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
