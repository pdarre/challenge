import 'package:challenge/data/repository/product_repository_impl.dart';
import 'package:challenge/domain/repository/product_repository.dart';
import 'package:get_it/get_it.dart';

import '../data/datasource/remote_datasource/product_remote_datasource.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerFactory<ProductRemoteDataSource>(
      () => ProductRemoteDataSource());

  locator.registerFactory<IProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: locator.get()));

  // _injector.registerLazySingleton<FirestoreService>(() => FirestoreService());
  // _injector.registerLazySingleton<GamesRepository>(
  //     () => GamesRepositoryImpl(_injector<FirestoreService>()));

  // // Providers
  // _injector.registerLazySingleton<GameProvider>(
  //     () => GameProvider(_injector<GetGameUC>()));

  // // Use Cases
  // _injector.registerLazySingleton<GetGameUC>(
  //     () => GetGameUC(_injector<GamesRepository>()));
}
