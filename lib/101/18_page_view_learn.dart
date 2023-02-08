import 'package:flutter/material.dart';
import 'package:starter_package/101/11_image_learn.dart';
import 'package:starter_package/101/16_stack_learn.dart';
import 'package:starter_package/101/6_icon_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.9);
  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    _currentPageIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.linear);
           
            },
            child: const Icon(Icons.chevron_left),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.ease);
              },
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        //sayfayi tam basinda

        padEnds: false,
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const StackLearn(),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
