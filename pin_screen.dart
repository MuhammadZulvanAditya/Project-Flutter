import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Api.dart';
import 'HomeScreen.dart';
import 'PromoPanas.dart';
import 'GratisOngkir.dart';
import 'PaketSpecial.dart';
import 'profile_page.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController pinController = TextEditingController();
  String? savedPin;
  bool isAuthenticated = false;
  int _selectedIndex = 5; // Posisi Dashboard

  @override
  void initState() {
    super.initState();
    loadSavedPin();
  }

  void loadSavedPin() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedPin = prefs.getString('pin') ?? '1234'; // default jika belum diset
    });
  }

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Homescreen()));
    if (index == 1) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const PromoPanasPage()));
    if (index == 2) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const GratisOngkirPage()));
    if (index == 3) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const PaketSpecialPage()));
    if (index == 4) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
    if (index == 5) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const PinScreen()));
  }

  @override
  Widget build(BuildContext context) {
    if (isAuthenticated) {
      return const Api();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your PIN',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please enter your pin that you have\ncreated',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Icon(Icons.lock_outline, size: 50, color: Colors.red),
              const SizedBox(height: 20),
              TextField(
                controller: pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String enteredPin = pinController.text;
                  if (enteredPin == savedPin) {
                    setState(() {
                      isAuthenticated = true;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('PIN Salah. Coba lagi.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Icon(Icons.lock_open, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color.fromARGB(255, 255, 86, 170),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: 'Promo'),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Ongkir'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Paket'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Akun'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Secret'),
        ],
      ),
    );
  }
}
