part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesEvent {
  final CategoriesUseCases categoriesUseCases;
  final List<Category> categoriesList = [];
  GetCategoriesEvent(this.categoriesUseCases);
  @override
  List<Object> get props => [categoriesList];
}

class AddNewCategory extends CategoriesEvent {
  final String name;
  final String color;
  AddNewCategory(this.name, this.color);
  @override
  List<Object> get props => [name, color];
}
