import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoply/features/auth/presentation/Providers/Controllers_Providers.dart';

class LoginBottomSheet extends ConsumerStatefulWidget {
  const LoginBottomSheet({
    super.key,
  });

  @override
  _LoginBottomSheetState createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends ConsumerState<LoginBottomSheet> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = ref.read(loginFormKey);
    _emailController = ref.read(login_EmailProvider);
    _passwordController = ref.read(login_PasswordProvider);
  }

  @override
  void dispose() {
    log("disposed");
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  void expander() {
    ref.read(bottomsheet_scrollController).animateTo(
          0.9,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Login with Email',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onTap: expander,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onTap: expander,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ]),
          SizedBox(
            height: 20.h,
          ),
          // Login Button
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                log("valid");
                GoRouter.of(context).go('/home');
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.titleLarge!.apply(
                      fontWeightDelta: 2,
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
