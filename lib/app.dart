import 'package:flutter/material.dart';
import 'package:takrorlash/page/splash_page.dart';

import 'core/config/app_routes.dart';

class PictureCharadeApp extends StatelessWidget {
  const PictureCharadeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      initialRoute: AppRoutes.splashPage,
      routes: AppRoutes.appRoutes,
    );
  }
}
