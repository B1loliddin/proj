import 'package:flutter/material.dart';
import 'package:proj/pages/home_page.dart';
import 'package:proj/pages/order_details_page.dart';
import 'package:proj/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        'home-page': (context) => HomePage(),
        'order-details-page': (context) => OrderDetailsPage(),
      },
      initialRoute: '/',
      // home: HomePage(),
    );
  }
}
