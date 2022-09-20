part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends HomeEvent {
  final ProductUseCases productUseCases;
  final List<Product> productList = [];
  GetProductsEvent({required this.productUseCases});
  @override
  List<Object> get props => [productList];
}
