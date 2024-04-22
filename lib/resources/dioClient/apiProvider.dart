// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:e_com_app/repos/models/products_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));

  Future<Products> fetchProducts() async {
    try {
      Response response = await dio.get('products');
      return Products.fromJson(response.data);
    } catch (e) {
      return fetchProducts();
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      Response response = await dio.get('products/categories');
      dio.interceptors.add(PrettyDioLogger());
      if (response.statusCode == 200) {
        List<String> categories = List<String>.from(response.data);
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      return fetchCategories();
    }
  }
}
