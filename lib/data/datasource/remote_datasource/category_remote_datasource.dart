import 'package:challenge/data/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<List<Category>> getAllCategories() async {
    try {
      var queryResponse = await db.collection('categories').get();
      return queryResponse.docs
          .map((e) => Category.fromDocumentSnapshot(e))
          .toList();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
