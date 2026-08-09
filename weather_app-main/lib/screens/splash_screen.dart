import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();


    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            const Icon(
              Icons.cloud,
              size: 100,
              color: Colors.blue,
            ),


            const SizedBox(height: 30),


            const Text(
              'WEATHER',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 10),


            const Text(
              'Stay Updated. Stay Prepared.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),


            const SizedBox(height: 40),


            const CircularProgressIndicator(),


            const SizedBox(height: 15),


            const Text('Loading...'),
          ],
        ),
      ),
    );
  }
}



