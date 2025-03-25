import'package:flutter/material.dart';
import 'package:takrorlash/model/picture_charade.dart';
import 'package:takrorlash/page/game_page.dart';
import 'package:takrorlash/page/home_page.dart';
import 'package:takrorlash/page/result_page.dart';
import 'package:takrorlash/page/splash_page.dart';
sealed class AppRoutes{
  static const home ="";
  static const gamePage ="gamePage";
  static const splashPage ="splashPage";
  static const resultPage ="resultPage";
//
//   static  Map<String, Widget Function(BuildContext)>appRoutes={
//   home:(context)=>HomePage(items: []),
//   gamePage:(context)=>GamePage(items: <PictureCharade>[]),
//     splashPage:(context)=>SplashPage(),
//     resultPage:(context)=>ResultPage(correct: 0, wrong: 0)
// };
}