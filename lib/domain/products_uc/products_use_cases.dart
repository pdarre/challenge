import 'package:challenge/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/product.dart';

class ProductUseCases {
  final IProductRepository productRepository;
  ProductUseCases({required this.productRepository});

  Future<Either<Exception, List<Product>>> getAllProducts() {
    return productRepository.getAllProducts();
  }
}
