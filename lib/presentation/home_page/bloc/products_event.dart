part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductsEvent {
  final ProductUseCases productUseCases;
  final List<Product> productList = [];
  GetProductsEvent(this.productUseCases);
  @override
  List<Object> get props => [productList];
}

class GetProductsByCategory extends ProductsEvent {
  final ProductUseCases productUseCases;
  final String catName;
  final List<Product> productList = [];
  GetProductsByCategory(this.catName, this.productUseCases);
  @override
  List<Object> get props => [productList];
}
