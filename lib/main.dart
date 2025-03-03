import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/features/auth/presentation/Screens/auth_screen.dart';
import 'package:shoply/features/onboarding/onboarding_screen.dart';
import 'package:shoply/features/splash/splash_screen.dart';
import 'package:shoply/core/theme/theme_data.dart' show lightTheme;
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  Supabase.initialize(
    url: 'https://wtlfbojcnkwakmjqaety.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind0bGZib2pjbmt3YWttanFhZXR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA5MDQyNjAsImV4cCI6MjA1NjQ4MDI2MH0.CjhasoXlScrK7l9_0pJKVZe_jQiAX90peuWQb93ENbM',
  );

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

SupabaseClient supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootnavkey = GlobalKey<NavigatorState>();

  late final GoRouter _router = GoRouter(
    navigatorKey: _rootnavkey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: Duration(milliseconds: 1800),
          key: state.pageKey,
          child: OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: AuthScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(384.0, 817.0666666666667),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Shoply',
          theme: lightTheme,
          routerConfig: _router,
        );
      },
    );
  }
}
