import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/product.dart';
import '../../../domain/products_uc/products_use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductUseCases productUseCases;
  HomeBloc({required this.productUseCases}) : super(HomeInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(HomeLoading());
      var products = await productUseCases.getAllProducts();
      products.fold(
        (exception) => emit(HomeException(exception: exception.toString())),
        (productList) => emit(HomeLoaded(products: productList)),
      );
    });
  }
}
