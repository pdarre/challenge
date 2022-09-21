import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/product.dart';

class ProductRemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Product>> getAllProducts() async {
    try {
      var queryResponse = await db.collection('products').get();

      return queryResponse.docs.map((e) => Product.fromJson(e.data())).toList();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Product>> getProductsByCategory(String catName) async {
    try {
      var queryResponse = await db
          .collection('products')
          .where('category', isEqualTo: catName)
          .get();

      var ret =
          queryResponse.docs.map((e) => Product.fromJson(e.data())).toList();
      return ret;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
