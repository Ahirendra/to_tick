


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
//import 'package:to_trick/h';


import 'package:to_trick/pages/home_page.dart';class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[200],
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/todosplash.json'),
                  // Icon(
                  //   Icons.food_bank_outlined,
                  //   size: 60,
                  // ),
                  SizedBox(height: 20,),
                  Text(
                    'TO TICK',
                    style: GoogleFonts.playfairDisplay(fontSize: 52),
                  )
                ],
              ),
              ),
        ),
        );
    }
}