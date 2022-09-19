import 'dart:html';

import 'package:challenge/data/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/products_uc/products_use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductUseCases productUseCases;
  HomeBloc({required this.productUseCases}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    // on<SubmitForgotPasswordRequestEvent>(_onForgotPassword);
    // on<ForgotPasswordEmailChangedEvent>(_onEmailChanged);
  }
}
