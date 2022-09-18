part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> products;
  const HomeLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class HomeException extends HomeState {
  final Exception exception;
  const HomeException({required this.exception});
  @override
  List<Object> get props => [exception];
}
