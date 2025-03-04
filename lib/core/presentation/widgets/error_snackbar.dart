import 'dart:developer';

import 'package:flutter/material.dart';

class ErrorSnackbar {
  SnackBar call(String message, [String? error]) {
    log(error.toString());
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 1),
    );
  }
}
