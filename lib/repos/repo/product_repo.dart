import 'package:e_com_app/repos/models/products_model.dart';
import 'package:e_com_app/resources/dioClient/apiProvider.dart';

class ApiRepo {
  final _provider = ApiProvider();

  Future<Products> fetchProducts() {
    return _provider.fetchProducts();
  }

  Future<List<String>> fetchCategories() {
    return _provider.fetchCategories();
  }
}
