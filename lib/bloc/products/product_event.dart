part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProductsEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}
