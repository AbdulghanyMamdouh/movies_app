import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash Screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
