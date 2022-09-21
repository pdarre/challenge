import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/product.dart';
import '../../../domain/products_uc/products_use_cases.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductUseCases productUseCases;
  ProductsBloc(this.productUseCases) : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      var prodEither = await productUseCases.getAllProducts();
      prodEither.fold(
        (exception) => emit(ProductsException(exception: exception.toString())),
        (categoriesList) => emit(ProductsLoaded(categoriesList)),
      );
    });
    on<GetProductsByCategory>((event, emit) async {
      String name = event.catName;
      emit(ProductsLoading());
      var productsEither = await productUseCases.getProductsByCategory(name);
      productsEither.fold(
        (exception) => emit(ProductsException(exception: exception.toString())),
        (categoriesList) => emit(ProductsLoaded(categoriesList)),
      );
    });
  }
}
