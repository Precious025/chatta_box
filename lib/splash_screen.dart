import 'dart:async';

import 'package:chattabox/chat_overview_screen.dart';
import 'package:flutter/material.dart';

import 'bottom_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushNamed(BottomNavigator.routeName),
    );
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/chattabox logo.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Text(
                      'Bamtick',
                      style: TextStyle(color: Color.fromRGBO(60, 60, 67, 0.6)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
