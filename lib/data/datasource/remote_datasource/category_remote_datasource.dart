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

  Future<bool> addCategory(String color, String name) async {
    var query;
    try {
      var data = {
        'color': color,
        'name': name,
        'isExpanded': false,
      };

      var queryResponse = await db
          .collection('categories')
          .where('name'.toLowerCase(), isEqualTo: name.toLowerCase())
          .get();
      if (queryResponse.docs.isEmpty) {
        query = await db.collection('categories').add(data);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
