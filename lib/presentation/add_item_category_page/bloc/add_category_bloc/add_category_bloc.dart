import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/products_uc/categories_use_cases.dart';

part 'add_category_event.dart';
part 'add_category_state.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  final CategoriesUseCases categoriesUseCases;
  AddCategoryBloc(this.categoriesUseCases) : super(AddCategoryInitial()) {
    on<AddNewCategoryEvent>((event, emit) async {
      String color = event.color;
      String name = event.name;
      emit(AddCategoryLoading());
      var response = await categoriesUseCases.addCategory(color, name);
      response.fold(
        (exception) =>
            emit(AddCategoryException(exception: exception.toString())),
        (isSuccess) => emit(AddCategoryLoaded(isSuccess: isSuccess)),
      );
    });
  }
}
