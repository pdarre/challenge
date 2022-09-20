import 'package:challenge/data/repository/product_repository_impl.dart';
import 'package:challenge/domain/products_uc/products_use_cases.dart';
import 'package:challenge/domain/repository/product_repository.dart';
import 'package:get_it/get_it.dart';

import '../data/datasource/remote_datasource/product_remote_datasource.dart';
import '../presentation/home_page/bloc/home_bloc.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerFactory<ProductRemoteDataSource>(
      () => ProductRemoteDataSource());

  locator.registerFactory<IProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: locator.get()));

  locator.registerFactory<ProductUseCases>(
      () => ProductUseCases(productRepository: locator.get()));

  locator.registerFactory<GetProductsEvent>(
      () => GetProductsEvent(productUseCases: locator.get()));
}
