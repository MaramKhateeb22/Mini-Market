import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';


import '../../../../core/cache_helper/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String nextPage = "";

  @override
  void initState() {
    initNextPage();
    super.initState();
  }

  initNextPage() async {
    // final instance = await SharedPreferences.getInstance();
    // if (instance.getStringList("data") != null) {
    if (cacheHelper.getUser() != null) {
      nextPage = "/home_view";

    } else {
      nextPage = "/select_pageView";

    }
    await Future.delayed(Duration(seconds: 5));
    GoRouter.of(context).go(nextPage);

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child:
          Lottie.asset('assets/animation/Animation - 1715027109087.json',repeat: true),
      ),
    );
  }
}
