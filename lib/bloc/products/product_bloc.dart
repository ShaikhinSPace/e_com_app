import 'package:e_com_app/repos/models/products_model.dart';
import 'package:e_com_app/repos/repo/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final ApiRepo apiRepo = ApiRepo();

    on<LoadProductsEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        final productList = await apiRepo.fetchProducts();
        emit(ProductLoaded(productList));
      } catch (e) {
        emit(ProductError('$e'));
      }
    });
  }
}
