import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../data/model/product.dart';

abstract class IProductRepository {
  Future<Either<Exception, List<Product>>> getAllProducts();

  Future<Either<Exception, List<Product>>> getProductsByCategory(
      String catName);

  Future<Either<Exception, bool>> addProduct(
      String category, String description, File image, String name);

  Future<Either<Exception, bool>> deleteProductByName(String prodName);
}
