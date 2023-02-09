import 'package:flutter/material.dart';
import 'package:starter_package/101/10_card_learn.dart';
import 'package:starter_package/101/11_image_learn.dart';
import 'package:starter_package/101/16_stack_learn.dart';
import 'package:starter_package/101/6_icon_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _nothcedValue = 10;

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
              child: _myTabs()),
          appBar: AppBar(),
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
        const ImageLearn(),
        IconLearnView(),
        const CardLearn(),
        const StackLearn(),
      ],
    );
  }
}

enum _MyTabViews { home, settings, fovourite, profile }

extension _MyTabViewExtension on _MyTabViews {}
