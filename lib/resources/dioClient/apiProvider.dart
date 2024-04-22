import 'package:dio/dio.dart';
import 'package:e_com_app/repos/models/products_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));

  Future<Products> fetchProducts() async {
    dio.interceptors.add(PrettyDioLogger());
    try {
      Response response = await dio.get('products');
      print("data :::{$response}");
      return Products.fromJson(response.data);
    } catch (e, stacktrace) {
      print('$e $stacktrace');

      return fetchProducts();
    }
  }
}
