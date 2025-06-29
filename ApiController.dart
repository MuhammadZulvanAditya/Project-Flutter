import 'package:dio/dio.dart';

class Apicontroller {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchPhotos() async {
    try {
      final response = await _dio.get('https://picsum.photos/v2/list?page=1&limit=5');

      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List) {
          return data;
        } else if (data is Map && data.containsKey('data')) {
          return data['data'] as List<dynamic>;
        } else if (data is Map && data.containsKey('photos')) {
          return data['photos'] as List<dynamic>;
        } else {
          throw Exception('Data format not supported');
        }
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      print('Error fetching photos: $e');
      return [];
    }
  }
}
