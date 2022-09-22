import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../data/model/product.dart';
import '../repository/product_repository.dart';

class ProductUseCases {
  final IProductRepository productRepository;
  ProductUseCases(this.productRepository);

  Future<Either<Exception, List<Product>>> getAllProducts() async {
    return await productRepository.getAllProducts();
  }

  Future<Either<Exception, List<Product>>> getProductsByCategory(
      String name) async {
    return await productRepository.getProductsByCategory(name);
  }

  Future<Either<Exception, bool>> addProduct(
      String category, String description, File image, String name) async {
    return await productRepository.addProduct(
        category, description, image, name);
  }
}
