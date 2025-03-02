import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(milliseconds: 1500),
      () {
        GoRouter.of(context).goNamed('onboarding');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/shoply.png',
      splashIconSize: 128,
      animationDuration: Duration(milliseconds: 750),
      backgroundColor: Color(0xFF224EE1),
      disableNavigation: true,
      nextScreen: Container(),
    );
  }
}
