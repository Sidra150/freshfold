import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freshfold_app/Views/Screens/Launch_Screen/launch.dart';

import '../../../Utils/Constants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Launch(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorConstants.backgroundColor1,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         colors: [
        //   ColorConstants.backgroundColor1,
        //       Colors.white,
        //
        //     ])),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/logo.png")),
          ],
        ),
      ),
    );
  }
}
