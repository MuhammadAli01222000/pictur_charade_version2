import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:takrorlash/core/theme/dimens.dart';

import '../service/app_controller.dart';
import 'game_page.dart';
import 'home_page.dart';

const splash_animation = 'assets/animation/splash_pages.json';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    final controller = AppController();
    final items = await controller.readData();
    for (var i = 0; i < AppDimens.d5; i++) {
      await Future.delayed(Duration(seconds: 1));
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => GamePage(items: items)),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset(splash_animation,width: AppDimens.d300,height: AppDimens.d600),),

        ],
      ),
    );
  }
}
