import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/product.dart';

class ProductRemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Product>> getAllProducts() async {
    try {
      var queryResponse = await db.collection('products').get();

      return queryResponse.docs
          .map((e) => Product.fromDocumentSnapshot(e))
          .toList();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
