import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
    super.initState();
  }

  late AnimationController controller;

  // Text('data', style: context.textTheme().bodyLarge)

  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              opacity: _isOpacity ? 1 : kZero,
              duration: _DurationItems.durationLow,
              child: const Text('data'),
            ),
            trailing: IconButton(onPressed: _changeOpacity, icon: const Icon(Icons.present_to_all)),
          ),
          AnimatedDefaultTextStyle(
              style:
                  (_isVisible ? context.textTheme().bodyLarge : context.textTheme().headlineSmall) ?? const TextStyle(),
              duration: _DurationItems.durationLow,
              child: const Text('a')),
          AnimatedIcon(icon: AnimatedIcons.list_view, progress: controller),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            height: _isVisible ? MediaQuery.of(context).size.height * 0.2 : kZero,
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.green,
            curve: Curves.easeIn,
          ),
          Expanded(
              child: Stack(
            children: const [
              AnimatedPositioned(top: 50, duration: _DurationItems.durationLow, child: Text('data')),
            ],
          )),
          Expanded(
            //listeye animasyonlu ekleniyor
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return const Text('data');
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : kZero);
        },
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox(),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLow,
    );
  }
}

// theme.of(context).textTheme(subtitle vsvs yazmana gerek yok)
extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
