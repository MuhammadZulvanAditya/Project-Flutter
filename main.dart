//Muhammad Zulvan Aditya
//1462200168
//SESI 4

import 'package:flutter/material.dart';
import 'package:pab_aktivitas_1/splashscreen.dart';
import 'HomeScreen.dart';
import 'PromoPanas.dart';
import 'GratisOngkir.dart';
import 'PaketSpecial.dart';
import 'profile_page.dart';
import 'pin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      routes: {
        '/home': (context) => const Homescreen(),
        '/promo': (context) => const PromoPanasPage(),
        '/ongkir': (context) => const GratisOngkirPage(),
        '/paket': (context) => const PaketSpecialPage(),
        '/akun': (context) => const ProfilePage(),
        '/secret': (context) => const PinScreen(),
      },
    );
  }
}
