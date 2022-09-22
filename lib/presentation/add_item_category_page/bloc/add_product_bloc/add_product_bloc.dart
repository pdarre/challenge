import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:challenge/domain/products_uc/products_use_cases.dart';
import 'package:equatable/equatable.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final ProductUseCases productUseCases;
  AddProductBloc(this.productUseCases) : super(AddProductInitial()) {
    on<AddNewProductEvent>((event, emit) async {
      String category = event.category;
      String description = event.description;
      File image = event.image;
      String name = event.name;
      emit(AddProductLoading());
      var response =
          await productUseCases.addProduct(category, description, image, name);
      response.fold(
        (exception) =>
            emit(AddProductException(exception: exception.toString())),
        (isSuccess) => emit(AddProductLoaded(isSuccess: isSuccess)),
      );
    });
  }
}
