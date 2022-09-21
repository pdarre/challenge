import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/category.dart';

class CategoryRemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Category>> getAllCategories() async {
    try {
      var queryResponse = await db.collection('categories').get();

      var xx =
          queryResponse.docs.map((e) => Category.fromJson(e.data())).toList();
      return xx;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
