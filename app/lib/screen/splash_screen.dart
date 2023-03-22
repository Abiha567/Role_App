import 'dart:async';
import 'package:app/screen/Login_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
    Navigator.push(
      context,
     MaterialPageRoute(builder: (context) => Login())
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Colors.deepOrangeAccent,
               Colors.red
            ],
            begin: Alignment.topRight,
             ),
        ),
        child: const Center(
          child: Text(
          'SAFE  AND  QUICK  PAKISTAN',
          style: TextStyle(
            color: AppColors.color8,
            fontWeight: FontWeight.bold,
            fontSize: 22
          )),
        ),
      ),
    );
  }
}
