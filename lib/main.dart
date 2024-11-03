import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proj/app.dart';

void main() {
  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (error, stack) {
      debugPrint('Error: $error');
    },
  );
}
