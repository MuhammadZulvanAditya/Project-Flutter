//Muhammad Zulvan Aditya
//1462200168
//SESI 4

import 'package:flutter/material.dart';

class GratisOngkirPage extends StatelessWidget {
  const GratisOngkirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gratis Ongkir'),
        backgroundColor: const Color.fromARGB(255, 255, 86, 170),
      ),
      body: const Center(
        child: Text(
          'Selamat! Gratis Ongkir untuk pesanan kamu.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 86, 170),
        currentIndex: 2,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/promo');
              break;
            case 2:
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/paket');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/akun');
              break;
            case 5:
              Navigator.pushReplacementNamed(context, '/secret');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Promo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Ongkir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Paket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            label: 'Secret',
          ),
        ],
      ),
    );
  }
}
