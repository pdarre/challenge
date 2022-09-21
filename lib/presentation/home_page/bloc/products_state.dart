part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsException extends ProductsState {
  final String exception;
  const ProductsException({required this.exception});
  @override
  List<Object> get props => [exception];
}

class ProductsLoaded extends ProductsState {
  List<Product> products;
  ProductsLoaded(this.products);
  @override
  List<Object> get props => [products];
}
