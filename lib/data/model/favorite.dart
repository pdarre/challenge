import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  final int prodId;
  final DateTime date;
  Favorite({
    required this.prodId,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'prodId': prodId,
      'date': date,
    };
  }

  Favorite.fromDocumentSnapshot(QueryDocumentSnapshot<Object?> doc)
      : prodId = doc['prodId'],
        date = DateTime.parse(doc['date'].toDate().toString());

  Favorite copyWith({
    required int prodId,
    required DateTime date,
  }) {
    return Favorite(
      prodId: this.prodId,
      date: this.date,
    );
  }
}
