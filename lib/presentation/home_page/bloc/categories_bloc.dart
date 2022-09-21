import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/category.dart';
import '../../../domain/products_uc/categories_use_cases.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesUseCases categoriesUseCases;
  CategoriesBloc(this.categoriesUseCases) : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoriesLoading());
      var catEither = await categoriesUseCases.getAllCategories();
      catEither.fold(
        (exception) =>
            emit(CategoriesException(exception: exception.toString())),
        (categoriesList) => emit(CategoriesLoaded(categoriesList)),
      );
    });
  }
}
