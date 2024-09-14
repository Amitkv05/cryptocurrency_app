import 'dart:async';

import 'package:cryptocurrency_app/pages/components/navbar.dart';
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
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Navbar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white
              // gradient: LinearGradient(
              //   colors: [Color(0xff081c36), Color(0xff0b4da2), Color(0xff067cc1)],
              //   stops: [0, 0.5, 0.8],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
              // gradient: LinearGradient(
              //   colors: [Color(0xfff5ce6b), Color(0xffc49003)],
              //   stops: [0, 1],
              //   begin: Alignment.bottomRight,
              //   end: Alignment.topLeft,
              // ),
              ),
          child: Image.asset(
            'assets/images/1.gif',
          )
          // child: const Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       '     Crypto',
          //       style: TextStyle(
          //         fontSize: 44,
          //         fontWeight: FontWeight.w900,
          //         color: Color(0xff081c36),
          //       ),
          //     ),
          //     Text(
          //       '            Curriency',
          //       style: TextStyle(
          //         fontSize: 44,
          //         fontWeight: FontWeight.w900,
          //         color: Color(0xff081c36),
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
