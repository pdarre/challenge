import 'package:challenge/data/model/product.dart';
import 'package:dartz/dartz.dart';

import '../../domain/model/category.dart';
import '../../domain/repository/product_repository.dart';
import '../../utils/data_result.dart';
import '../datasource/remote_datasource/product_remote_datasource.dart';

class ProductRepositoryImpl implements IProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Exception, List<Product>>> getAllProducts() async {
    try {
      var response = await productRemoteDataSource.getAllProducts();
      return Right(response);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<Product>>> getProductsByCategory(
      Category category) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

  @override
  Future<DataResult<Product>> addProduct(
      int prodId, Category category, String prodName) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<DataResult<bool>> deleteProductByName(String prodName) {
    // TODO: implement deleteProductByName
    throw UnimplementedError();
  }

  @override
  Future<DataResult<Product>> getProductByName(String prodName) {
    // TODO: implement getProductByName
    throw UnimplementedError();
  }

  @override
  Future<DataResult<int>> getProductIdByName(String prodName) {
    // TODO: implement getProductIdByName
    throw UnimplementedError();
  }

  @override
  Future<DataResult<Product>> updateProductByProdId(
      int prodId, Category category, String prodName) {
    // TODO: implement updateProductByProdId
    throw UnimplementedError();
  }
}
