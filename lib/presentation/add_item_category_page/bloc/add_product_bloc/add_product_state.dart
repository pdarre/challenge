part of 'add_product_bloc.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductException extends AddProductState {
  final String exception;
  const AddProductException({required this.exception});
  @override
  List<Object> get props => [exception];
}

class AddProductLoaded extends AddProductState {
  final bool isSuccess;
  const AddProductLoaded({required this.isSuccess});
  @override
  List<Object> get props => [isSuccess];
}
