import 'package:flutter/material.dart';
import 'package:starter_package/303/4_feed_view.dart';

import '../101/10_card_learn.dart';
import '../101/16_stack_learn.dart';
import '../101/6_icon_learn.dart';

class TabAdvanceLearn extends StatefulWidget {
  const TabAdvanceLearn({super.key});

  @override
  State<TabAdvanceLearn> createState() => _TabAdvanceLearnState();
}

class _TabAdvanceLearnState extends State<TabAdvanceLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _nothcedValue = 010;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: BottomAppBar(
            //themeden verildi
            //shape: const CircularNotchedRectangle(),
            notchMargin: _nothcedValue,
            child: _myTabs(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.home),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: _tabBarView(),
        ));
  }

  TabBar _myTabs() {
    return TabBar(
      //theme`den verilebilir
      //indicatorSize: TabBarIndicatorSize.label,
      //indicatorColor: Colors.white,

      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
      onTap: (int value) {},
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        const FeedView(),
        IconLearnView(),
        const CardLearn(),
        const StackLearn(),
      ],
    );
  }
}

enum _MyTabViews { home, settings, fovourite, profile }

extension _MyTabViewExtension on _MyTabViews {}
