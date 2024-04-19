import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<dynamic> fetchData() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
