import 'package:challenge/data/datasource/remote_datasource/category_remote_datasource.dart';
import 'package:challenge/data/model/category.dart';
import 'package:challenge/domain/repository/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl implements ICategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  const CategoryRepositoryImpl(this.categoryRemoteDataSource);

  @override
  Future<Either<Exception, List<Category>>> getAllCategories() async {
    try {
      var response = await categoryRemoteDataSource.getAllCategories();
      return Right(response);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> addCategory(String color, String name) async {
    try {
      var response = await categoryRemoteDataSource.addCategory(color, name);
      if (response) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
