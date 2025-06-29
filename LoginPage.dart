//Muhammad Zulvan Aditya
//1462200168
//SESI 4

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? nbi;
  String? nama;
  String? email;
  String? alamat;
  String? akunig;
  String? pin;

  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _nbi = prefs.getString('nbi');
    final String? _nama = prefs.getString('nama');
    final String? _email = prefs.getString('email');
    final String? _alamat = prefs.getString('alamat');
    final String? _akunig = prefs.getString('akunig');
    final String? _pin = prefs.getString('pin');

    setState(() {
      nbi = _nbi;
      nama = _nama;
      email = _email;
      alamat = _alamat;
      akunig = _akunig;
      pin = _pin;
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 163, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'MUHAMMAD ZULVAN ADITYA',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text('MACHINE LEARNING ENGINEERING', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text(
                "$nbi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/ijul.png', height: 200),
              const SizedBox(height: 20),
              Text(
                "$nama",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homescreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 0, 197),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
