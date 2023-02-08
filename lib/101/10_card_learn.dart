// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _CustomCard(
            child: const SizedBox(
              height: 100,
              width: 200,
              child: Center(
                child: Text('mirac'),
              ),
            ),
          ),
          _CustomCard(
            child: SizedBox(
                height: 100,
                width: 200,
                child: Center(
                  child: Image.network('https://picsum.photos/200/300', fit: BoxFit.fill),
                )),
          ),
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  _CustomCard({Key? key, required this.child}) : super(key: key);

  final Widget child;
  final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: roundedRectangleBorder,
      margin: ProjectMargins.cardMargin,
      child: child,
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}


//borders

//stadiumBorder
// circleBorder
//roundedRectangleBorder