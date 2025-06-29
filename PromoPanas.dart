//Muhammad Zulvan Aditya
//1462200168
//SESI 4

import 'package:flutter/material.dart';

class PromoPanasPage extends StatefulWidget {
  const PromoPanasPage({super.key});

  @override
  State<PromoPanasPage> createState() => _PromoPanasPageState();
}

class _PromoPanasPageState extends State<PromoPanasPage> {
  final List<Map<String, String>> menuItems = [
    {
      'name': 'Ebi Sushi',
      'price': '\$1.95',
      'image': 'assets/images/icon/sushi 1.png',
    },
    {
      'name': 'Salmon Sushi',
      'price': '\$2.50',
      'image': 'assets/images/icon/Salmon sushi.png',
    },
    {
      'name': 'Tuna Sushi',
      'price': '\$2.00',
      'image': 'assets/images/icon/tuna sushi.png',
    },
    {
      'name': 'California Roll',
      'price': '\$3.00',
      'image': 'assets/images/icon/california roll.png',
    },
  ];

  Set<int> _favoritedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo Panas'),
        backgroundColor: const Color.fromARGB(255, 255, 86, 170),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: menuItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  final isFavorited = _favoritedItems.contains(index);

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item['image']!, height: 80),
                        const SizedBox(height: 10),
                        Text(
                          item['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(item['price']!),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                isFavorited ? Colors.red : Colors.red.shade200,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isFavorited) {
                                _favoritedItems.remove(index);
                              } else {
                                _favoritedItems.add(index);
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Gallery Promo:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(10, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/promo/promo${index + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text('Keranjang'),
                          content: const Text('Sudah masuk keranjang yaa...'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Tutup'),
                            ),
                          ],
                        ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text('Add to cart'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 86, 170),
        currentIndex: 1,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/ongkir');
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
