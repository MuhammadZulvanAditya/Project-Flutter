//Muhammad Zulvan Aditya
//1462200168
//SESI 4

import 'package:flutter/material.dart';
import 'package:pab_aktivitas_1/LoginPage.dart';
import 'package:pab_aktivitas_1/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? nbi = prefs.getString('nbi');

      if (nbi != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (build) {
              return Loginpage();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (build) {
              return RegisterScreen();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff01500D),
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Image.asset('assets/images/bg1.png', scale: 2)),
      ),
    );
  }
}
