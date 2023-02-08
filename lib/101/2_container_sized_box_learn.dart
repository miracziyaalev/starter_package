import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text(
              'a' * 500,
            ),
          ),
          SizedBox.square(
            dimension: 50,
            child: Text("b" * 50),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 200, minWidth: 50),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectContainerDecoration(),
            child: Text("a" * 50),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 200, minWidth: 50),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: Text("a" * 50),
          ),
        ],
      ),
    );
  }
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [Colors.amber, Colors.black]),
          boxShadow: const [
            BoxShadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 1)
          ],
        );
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.red,
    gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
    boxShadow: const [
      BoxShadow(color: Colors.green, offset: Offset(1, 1), blurRadius: 1)
    ],
  );
}
