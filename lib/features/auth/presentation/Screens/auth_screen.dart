import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              InkWell(
                onTap: () {},
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
