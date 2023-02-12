import 'package:flutter/material.dart';
import 'package:starter_package/202/package/loading_bar.dart';

class PackageLearn extends StatefulWidget {
  const PackageLearn({super.key});

  @override
  State<PackageLearn> createState() => _PackageLearnState();
}

class _PackageLearnState extends State<PackageLearn> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('mirac alev', style: Theme.of(context).textTheme.bodyLarge),
          const LoadingBar(),
        ],
      ),
    );
  }
}
