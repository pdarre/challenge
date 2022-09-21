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
}
