import 'dart:async';
import 'package:flutter/material.dart';
import 'package:house_care/constant/color.dart';
import 'package:house_care/views/login/login.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset("assets/lottie/animation-home-1.json"),
            ],
          ),
        ),
      ),
    );
    // return AnimatedSplashScreen(
    //   splash: LottieBuilder.asset("lottie/animation-home-1.json"),
    //   splashIconSize: 400,
    //   nextScreen: const DashboardView(),
    //   backgroundColor: Colors.grey.shade100,
    // );
  }
}
