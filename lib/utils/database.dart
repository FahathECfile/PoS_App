import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String userUid;

static Stream<QuerySnapshot> readItem() {
  CollectionReference noteItemCollection = _mainCollection.doc(userUid).collection('items');
  
}
  static Future<void> addItem(
      {String name, int no, String code, int gst, int price}) async {
    DocumentReference documentReference =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "Item name": name,
      "Item no": no,
      "code": code,
      "GST": gst,
      "Price": price,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Item is added"))
        .catchError((e) => print(e));
  }
}
