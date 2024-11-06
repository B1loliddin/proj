import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateToHomePage();
  }

  void navigateToHomePage() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (mounted) Navigator.of(context).pushReplacementNamed('home-page');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Image(
            image: AssetImage('assets/images/img_logo.png'),
          ),
        ),
      ),
    );
  }
}
