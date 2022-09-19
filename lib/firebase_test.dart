import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseTest {
  static CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  static CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  static Future<void> getCategories() async {
    categories.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        debugPrint(doc["name"]);
      }
    });
  }

  static Future<void> getProducts() async {
    await products.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        debugPrint(doc["name"]);
      });
    });
  }
}
