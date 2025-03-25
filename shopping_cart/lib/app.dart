import 'package:flutter/material.dart';
import 'package:shopping_cart/presentation/cart_screen.dart';
import 'package:shopping_cart/presentation/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart App',
      debugShowCheckedModeBanner: false, // Hide the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), // Home screen route
        '/cart': (context) => CartScreen(), // Cart screen route
      },
    );
  }
}
