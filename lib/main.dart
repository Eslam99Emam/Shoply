import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoply/core/theme/theme_notifier.dart';
import 'package:shoply/features/onboarding/onboarding_screen.dart';
import 'package:shoply/features/splash/splash_screen.dart';
import 'package:shoply/core/theme/theme_data.dart' show lightTheme, darkTheme;



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

ThemeNotifier mode = ThemeNotifier();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: OnboardingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Shoply',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: mode.themeMode,
      routerConfig: _router,
    );
  }
}