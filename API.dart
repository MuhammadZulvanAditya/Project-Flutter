import 'package:flutter/material.dart';
import 'ApiController.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _Api();
}

class _Api extends State<Api> {
  late Future<List<dynamic>> _ApiController;

  @override
  void initState() {
    super.initState();
    _ApiController = Apicontroller().fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Grid')),
      body: FutureBuilder<List<dynamic>>(
        future: _ApiController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data ditemukan.'));
          }

          final photos = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, 
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.network(
                          photo['download_url'],
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 6),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        photo['author'] ?? 'Tanpa Judul',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,                       
                      ),
                    ),
                    
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
