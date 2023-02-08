import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.userName});
  final String? userName;
  final String name = "Mirac";
  final String name2 = "Eren";

  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ('Welcome, $name'),
            style: ProjectStyles.welcomeStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          Text(
            ('Hello, $name2'),
            style: ProjectStyles.welcomeStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          Text(
            ('Hello, $name2'),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: ProjectColors.welcomeColor,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          Text(
            (userName ?? ''),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: ProjectColors.welcomeColor,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          Text(keys.welcomeText),
        ],
      )),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    color: ProjectColors.welcomeColor,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.white;
}

class ProjectKeys {
  final String welcomeText = "Welcome Everybody";
}
