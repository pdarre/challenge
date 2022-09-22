part of 'add_category_bloc.dart';

abstract class AddCategoryState extends Equatable {
  const AddCategoryState();

  @override
  List<Object> get props => [];
}

class AddCategoryInitial extends AddCategoryState {}

class AddCategoryLoading extends AddCategoryState {}

class AddCategoryException extends AddCategoryState {
  final String exception;
  const AddCategoryException({required this.exception});
  @override
  List<Object> get props => [exception];
}

class AddCategoryLoaded extends AddCategoryState {
  final bool isSuccess;
  const AddCategoryLoaded({required this.isSuccess});
  @override
  List<Object> get props => [isSuccess];
}
