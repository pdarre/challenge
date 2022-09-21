part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesException extends CategoriesState {
  final String exception;
  const CategoriesException({required this.exception});
  @override
  List<Object> get props => [exception];
}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;
  const CategoriesLoaded(this.categories);
  @override
  List<Object> get props => [categories];
}
