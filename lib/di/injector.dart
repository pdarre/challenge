import 'package:get_it/get_it.dart';

import '../data/datasource/remote_datasource/category_remote_datasource.dart';
import '../data/datasource/remote_datasource/product_remote_datasource.dart';
import '../data/repository/category_repository_impl.dart';
import '../data/repository/product_repository_impl.dart';
import '../domain/products_uc/categories_use_cases.dart';
import '../domain/products_uc/products_use_cases.dart';
import '../domain/repository/category_repository.dart';
import '../domain/repository/product_repository.dart';
import '../presentation/add_item_category_page/bloc/add_category_bloc/add_category_bloc.dart';
import '../presentation/home_page/bloc/categories_bloc.dart';
import '../presentation/home_page/bloc/products_bloc.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerFactory<ProductRemoteDataSource>(
      () => ProductRemoteDataSource());

  locator.registerFactory<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSource());

  locator.registerFactory<IProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: locator.get()));

  locator.registerFactory<ICategoryRepository>(
      () => CategoryRepositoryImpl(locator.get()));

  locator
      .registerFactory<ProductUseCases>(() => ProductUseCases(locator.get()));

  locator.registerFactory<CategoriesUseCases>(
      () => CategoriesUseCases(locator.get()));

  locator
      .registerFactory<GetProductsEvent>(() => GetProductsEvent(locator.get()));

  locator.registerFactory<GetCategoriesEvent>(
      () => GetCategoriesEvent(locator.get()));

  locator.registerFactory<ProductsBloc>(() => ProductsBloc(locator.get()));

  locator
      .registerFactory<AddCategoryBloc>(() => AddCategoryBloc(locator.get()));
}
