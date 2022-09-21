import 'package:challenge/data/model/category.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepository {
  Future<Either<Exception, List<Category>>> getAllCategories();
}
