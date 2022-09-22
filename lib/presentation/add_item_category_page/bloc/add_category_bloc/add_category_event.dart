part of 'add_category_bloc.dart';

abstract class AddCategoryEvent extends Equatable {
  const AddCategoryEvent();

  @override
  List<Object> get props => [];
}

class AddNewCategoryEvent extends AddCategoryEvent {
  final CategoriesUseCases categoriesUseCases;
  final bool isSuccess;
  final String color;
  final String name;
  const AddNewCategoryEvent(
    this.categoriesUseCases,
    this.isSuccess,
    this.color,
    this.name,
  );
  @override
  List<Object> get props => [isSuccess, color, name];
}
