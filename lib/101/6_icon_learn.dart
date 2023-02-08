import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});

  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Learn'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
            iconSize: iconSizes.iconSmall,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
            color: iconColors.amber,
            iconSize: iconSizes.iconSmall,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
            color: iconColors.blue,
            iconSize: iconSizes.iconSmall,
          ),
        ],
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 40.0;
  final double iconSmall2x = 80.0;
}

class IconColors {
  final Color red = Colors.red;
  final Color amber = Colors.amber;
  final Color blue = Colors.blue;
}
