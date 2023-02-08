// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});
  final String data =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  final String title = 'Create Your First Note';

  final String data2 = 'Create A Note';
  final String data3 = 'Import Notes';

  final String deneme = 'mirac';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: ProjectDemosPadding().horizontalPaddingSmall,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 200,
                child: CustomImageAssets(path: ImageItems().notFound),
              ),
              _TitleWidget(title: title),
              Padding(
                padding: ProjectDemosPadding().verticalPaddingSmall,
                child: _SubtitleWidget(
                  data: data,
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                      height: StaticHeightValue().heightValue,
                      child: Center(
                          child: Text(
                        data2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )))),
              TextButton(onPressed: () {}, child: Text(data3))
            ],
          ),
        ),
      ),
    );
  }
}

class StaticHeightValue {
  final double heightValue = 50;
}

class _SubtitleWidget extends StatelessWidget {
  // ignore: unused_element
  const _SubtitleWidget({Key? key, required this.data, this.chosenAlign = TextAlign.center}) : super(key: key);

  final String data;
  final TextAlign chosenAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
      textAlign: chosenAlign,
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
    );
  }
}

class ProjectDemosPadding {
  final horizontalPaddingSmall = const EdgeInsets.symmetric(horizontal: 20);
  final verticalPaddingSmall = const EdgeInsets.symmetric(vertical: 20);
}

class ProjectsPaddingDemosSuper extends EdgeInsets {
  const ProjectsPaddingDemosSuper.symmetric() : super.symmetric();
}

class ImageItems {
  final String appleBook = "assets/appleBook.png";
  final String notFound = "notFound.png";
}

class CustomImageAssets extends StatelessWidget {
  const CustomImageAssets({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _imagePath,
      fit: BoxFit.contain,
    );
  }

  String get _imagePath => "assets/png/$path";
}
