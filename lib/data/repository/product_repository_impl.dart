import 'dart:io';

import 'package:challenge/domain/model/category.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/product_repository.dart';
import '../datasource/remote_datasource/product_remote_datasource.dart';
import '../model/product.dart';

class ProductRepositoryImpl implements IProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Exception, List<Product>>> getAllProducts() async {
    try {
      var response = await productRemoteDataSource.getAllProducts();
      return Right(response);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<Product>>> getProductsByCategory(
      String catName) async {
    try {
      var response =
          await productRemoteDataSource.getProductsByCategory(catName);
      return Right(response);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> addProduct(
      String category, String description, File image, String name) async {
    try {
      var response = await productRemoteDataSource.addPoduct(
          category, description, image, name);
      if (response!) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> deleteProductByName(String prodName) {
    // TODO: implement deleteProductByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Product>> getProductByName(String prodName) {
    // TODO: implement getProductByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, int>> getProductIdByName(String prodName) {
    // TODO: implement getProductIdByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Product>> updateProductByProdId(
      int prodId, Category category, String prodName) {
    // TODO: implement updateProductByProdId
    throw UnimplementedError();
  }
}
