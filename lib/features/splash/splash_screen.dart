import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    ).whenComplete(
      () {
        GoRouter.of(context).go('/onboarding');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF224EE1),
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/shoply.svg',
          width: 128.sp,
          height: 128.sp,
        ),
      ),
    );
  }
}
