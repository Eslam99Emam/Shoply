import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoply/core/presentation/widgets/error_snackbar.dart';
import 'package:shoply/core/presentation/widgets/success_bottomsheet.dart';
import 'package:shoply/features/auth/domain/usecases/Google_Sign.dart';
import 'package:shoply/features/auth/presentation/Providers/Controllers_Providers.dart';
import 'package:shoply/features/auth/presentation/Providers/Google_Providers.dart';
import 'package:shoply/features/auth/presentation/Widgets/Login_Bottomsheet.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(bottomsheet_scrollController);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Page title
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Login to ',
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            fontWeightDelta: 1,
                          ),
                    ),
                    TextSpan(
                      text: 'SHOPLY.',
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            color: Theme.of(context).primaryColor,
                            fontWeightDelta: 4,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              // Login with Google
              InkWell(
                onTap: () async {
                  final result = await ref.read(googleSignUseCaseProvider)();
                  log(result.toString());
                  if (result) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) =>
                          SuccessBottomsheet(message: "Login successful"),
                    ).whenComplete(() {
                      // GoRouter.of(context).go('/home');
                    });
                  } else {
                    log("error");
                    ScaffoldMessenger.of(context).showSnackBar(
                      ErrorSnackbar()(
                        "Please, try again",
                      ),
                    );
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      'Login with Google',
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            fontWeightDelta: 2,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    leading: Image.asset(
                      'assets/icons/google.png',
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // Login with Facebook
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      'Login with Facebook',
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            fontWeightDelta: 2,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    leading: Image.asset(
                      'assets/icons/facebook.png',
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              // OR Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      'OR',
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                            color: Colors.grey.shade400,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              // Login with Email
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        expand: false,
                        snap: true,
                        snapSizes: const [0.7, 0.8, 0.9],
                        initialChildSize: 0.6,
                        minChildSize: 0.6,
                        maxChildSize: 0.9,
                        controller: scrollController,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: const LoginBottomSheet(),
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Text(
                    'Login with Email',
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          fontWeightDelta: 2,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Spacer(),
              // Don't have an account
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account yet? ',
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                            fontWeightDelta: -1,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
