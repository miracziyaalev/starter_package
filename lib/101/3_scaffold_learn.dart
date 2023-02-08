import 'package:flutter/material.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('scaffaaold'),
        centerTitle: true,
      ),
      body: const Center(child: Text('data')),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.abc), label: AutofillHints.addressState),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: 'aaa'),
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => CustomContainer(),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(),
    );
  }
}

class CustomShowModalBottomSheet extends BoxDecoration {
  CustomShowModalBottomSheet()
      : super(
          gradient: const LinearGradient(colors: [Colors.amber, Colors.blue]),
          borderRadius: BorderRadius.circular(20),
        );
}

class CustomContainer extends Container {
  CustomContainer({super.key})
      : super(
          height: 200,
          width: 200,
          decoration: CustomShowModalBottomSheet(),
        );
}
