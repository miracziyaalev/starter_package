import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:starter_package/product/constant/durations_items.dart';
import 'package:starter_package/product/constant/lottie_items.dart';
import 'package:starter_package/product/global/theme_notifer.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

//https://assets5.lottiefiles.com/packages/lf20_ydo1amjm.json
class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = true;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              await controller.animateTo(isLight ? 0.5 : 1);
              context.read<ThemeNotifer>().changeTheme();
              isLight = !isLight;
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath, repeat: false, controller: controller),
          )
        ],
      ),
      body: const LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });

  final _loadingLottie = 'https://assets2.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
