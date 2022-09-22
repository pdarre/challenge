import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/product.dart';

class ProductRemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final storage =
      FirebaseStorage.instanceFor(bucket: "gs://challenge-ct.appspot.com");

  final storageRef = FirebaseStorage.instance.ref();

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

  Future<bool?> addPoduct(
      String category, String description, File image, String name) async {
    var query;
    try {
      //TODO save File to storage, get address
      var fileAddress = 'later';

      var data = {
        'category': category,
        'description': description,
        'image': fileAddress,
        'name': name,
      };

      var queryResponse =
          await db.collection('products').where('name', isEqualTo: name).get();

      if (queryResponse.docs.isEmpty) {
        query = await db.collection('products').add(data);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
