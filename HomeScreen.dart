//Muhammad Zulvan Aditya
//1462200168
//SESI 4

import 'package:flutter/material.dart';
import 'package:pab_aktivitas_1/PromoPanas.dart';
import 'package:pab_aktivitas_1/GratisOngkir.dart';
import 'package:pab_aktivitas_1/PaketSpecial.dart';
import 'package:pab_aktivitas_1/profile_page.dart';
import 'pin_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool _isOrderPlaced = false;
  int _selectedPromoIndex = -1;
  int _selectedIndex = 0;

  final List<String> _promoItems = [
    'Promo panass',
    'Gratis Ongkir',
    'Paket Special',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PromoPanasPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GratisOngkirPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PaketSpecialPage()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
    else if (index == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PinScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Special Deals'),
        backgroundColor: const Color.fromARGB(255, 255, 102, 166),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.brown[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Special Deals',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '50% OFF',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'and get free delivery',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isOrderPlaced = !_isOrderPlaced;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _isOrderPlaced
                                      ? Colors.green
                                      : const Color.fromARGB(255, 255, 0, 0),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              _isOrderPlaced ? 'Order Placed!' : 'Order Now',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/icon/sushi 1.png',
                          width: 40,
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          'assets/images/icon/sushi 2.png',
                          width: 40,
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          'assets/images/icon/sushi 3.png',
                          width: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children:
                    _promoItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final promo = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPromoIndex = index;
                          });

                          if (promo == 'Promo panass') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const PromoPanasPage(),
                              ),
                            );
                          } else if (promo == 'Gratis Ongkir') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const GratisOngkirPage(),
                              ),
                            );
                          } else if (promo == 'Paket Special') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const PaketSpecialPage(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                _selectedPromoIndex == index
                                    ? Colors.orange[50]
                                    : Colors.white,
                            border: Border.all(
                              color:
                                  _selectedPromoIndex == index
                                      ? Colors.orange
                                      : Colors.grey[300]!,
                              width: _selectedPromoIndex == index ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            promo,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  _selectedPromoIndex == index
                                      ? Colors.orange[800]
                                      : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 86, 170),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), 
          label: 'Akun'),
           BottomNavigationBarItem(icon: Icon(Icons.security), 
          label: 'Secret'),
        ],
      ),
    );
  }
}
