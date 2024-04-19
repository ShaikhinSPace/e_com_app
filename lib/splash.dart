import 'dart:async';

import 'package:e_com_app/constants/Appassets.dart';
import 'package:e_com_app/constants/appfont.dart';
import 'package:e_com_app/features/home/home.dart';
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
          context, MaterialPageRoute(builder: (context) => MainScreen()));
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
          style: CustomTextStyle.heading1,
        ),
      )),
    );
  }
}
