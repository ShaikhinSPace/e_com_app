import 'dart:async';

import 'package:e_com_app/config/theme.dart';

import 'package:e_com_app/features/screens/home/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.default_Black,
      body: Center(
          child: Center(
        child: Text(
          'e - COM App',
        ),
      )),
    );
  }
}
