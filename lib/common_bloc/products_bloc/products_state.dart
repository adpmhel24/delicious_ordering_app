import 'package:delicious_ordering/data/models/products/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  ProductsState();
  @override
  List<Object?> get props => [];
}

class LoadingProductsState extends ProductsState {}

class InitState extends ProductsState {}

class NoDataState extends ProductsState {}

class LoadedProductsState extends ProductsState {
  final List<ProductModel> products;

  LoadedProductsState(this.products);
  @override
  List<Object?> get props => [products];
}

class ErrorState extends ProductsState {
  final String message;
  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
