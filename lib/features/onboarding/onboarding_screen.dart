import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List animations = [
    "assets/Animation1.json",
    "assets/Animation2.json",
    "assets/Animation3.json",
  ];

  List<List<Widget>> descs = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    descs = [
      [
        Text(
          "Fast Delivery",
          style: Theme.of(context).textTheme.displaySmall!.apply(
                fontWeightDelta: 3,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Lorem Ipsum Dolor, Lorem Ipsum Dolor, Lorem Ipsum Dolor",
          style: Theme.of(context).textTheme.titleMedium!.apply(
                color: Colors.grey.shade700,
              ),
          textAlign: TextAlign.center,
        ),
      ],
      [
        Text(
          "Fast Delivery",
          style: Theme.of(context).textTheme.displaySmall!.apply(
                fontWeightDelta: 3,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Lorem Ipsum Dolor, Lorem Ipsum Dolor, Lorem Ipsum Dolor",
          style: Theme.of(context).textTheme.titleMedium!.apply(
                color: Colors.grey.shade700,
              ),
          textAlign: TextAlign.center,
        ),
      ],
      [
        Text(
          "Fast Delivery",
          style: Theme.of(context).textTheme.displaySmall!.apply(
                fontWeightDelta: 3,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Lorem Ipsum Dolor, Lorem Ipsum Dolor, Lorem Ipsum Dolor",
          style: Theme.of(context).textTheme.titleMedium!.apply(
                color: Colors.grey.shade700,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    ];
  }

  int _currentIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip Button
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.blue.shade600),
                    ),
                  ),
                ],
              ),
              // Animations
              SizedBox(
                height: 400,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  itemCount: animations.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Lottie.asset(
                            animations[index],
                            width: 250,
                          ),
                          ...descs[index],
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Carousel and button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: animations.length,
                    effect: ExpandingDotsEffect(expansionFactor: 2),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_currentIndex >= animations.length - 1) {
                        // GoRouter.of(context);
                      } else {
                        pageController.nextPage(
                            duration: Durations.medium1,
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Container(
                      width: 120,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _currentIndex == animations.length - 1
                            ? "Get Started"
                            : "Next",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
