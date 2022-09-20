import 'package:dartz/dartz.dart';

import '../../data/model/product.dart';
import '../model/category.dart';

abstract class IProductRepository {
  Future<Either<Exception, List<Product>>> getAllProducts();

  Future<Either<Exception, List<Product>>> getProductsByCategory(
      Category category);

  Future<Either<Exception, Product>> getProductByName(String prodName);

  Future<Either<Exception, int>> getProductIdByName(String prodName);

  Future<Either<Exception, Product>> addProduct(
      int prodId, Category category, String prodName);

  Future<Either<Exception, bool>> deleteProductByName(String prodName);

  Future<Either<Exception, Product>> updateProductByProdId(
      int prodId, Category category, String prodName);
}
