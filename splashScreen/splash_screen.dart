// ignore_for_file: await_only_futures

import 'dart:async';

import 'package:proton/global/global.dart';
import 'package:flutter/material.dart';
import '../authentication/login_screen.dart';
import '../mainScreens/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 15), () async {
      if (await fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const MainScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('images/2.gif'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'protonride',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
