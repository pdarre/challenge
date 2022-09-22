import 'package:dartz/dartz.dart';

import '../../data/model/category.dart';
import '../repository/category_repository.dart';

class CategoriesUseCases {
  final ICategoryRepository categoryRepository;
  CategoriesUseCases(this.categoryRepository);

  Future<Either<Exception, List<Category>>> getAllCategories() async {
    return await categoryRepository.getAllCategories();
  }

  Future<Either<Exception, bool>> addCategory(String color, String name) async {
    return await categoryRepository.addCategory(color, name);
  }
}
