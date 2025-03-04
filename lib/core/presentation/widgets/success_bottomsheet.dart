import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessBottomsheet extends StatefulWidget {
  final String message;

  const SuccessBottomsheet({required this.message, super.key});

  @override
  State<SuccessBottomsheet> createState() => _SuccessBottomsheetState();
}

class _SuccessBottomsheetState extends State<SuccessBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: Theme.of(context).primaryColor,
                size: 125,
              ),
            ],
          ),
          Text(
            widget.message,
            style: Theme.of(context).textTheme.headlineMedium!.apply(
                  fontWeightDelta: 4,
                ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
