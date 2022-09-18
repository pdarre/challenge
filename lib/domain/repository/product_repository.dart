import 'package:dartz/dartz.dart';

import '../../data/model/product.dart';
import '../../utils/data_result.dart';
import '../model/category.dart';

abstract class IProductRepository {
  Future<Either<Exception, List<Product>>> getAllProducts();

  Future<Either<Exception, List<Product>>> getProductsByCategory(
      Category category);

  Future<DataResult<Product>> getProductByName(String prodName);

  Future<DataResult<int>> getProductIdByName(String prodName);

  Future<DataResult<Product>> addProduct(
      int prodId, Category category, String prodName);

  Future<DataResult<bool>> deleteProductByName(String prodName);

  Future<DataResult<Product>> updateProductByProdId(
      int prodId, Category category, String prodName);
}
