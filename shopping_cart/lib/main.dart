import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod for state management
import 'app.dart'; // Import the app widget

void main() {
  runApp(
    // Wrap the app with ProviderScope for Riverpod
    ProviderScope(
      child: MyApp(),
    ),
  );
}
