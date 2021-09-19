import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'databaseService.dart';

class UserModal with ChangeNotifier {
  String _uid = "";
  String _name = "";
  String _pronoun = "";
  Map<String, dynamic> data = new Map<String, dynamic>();

  String getUid() => _uid;
  void updateUid(String newUid) {
    _uid = newUid;
    notifyListeners();
  }

  String getName() => _name;
  void updateName(String newName) async {
    _name = newName;
    Map<String, dynamic> data = {"userName": _name};
    updateProfile(data);
    notifyListeners();
  }

  String getPronoun() => _pronoun;
  void updatePronoun(String newPro) {
    _pronoun = newPro;
    notifyListeners();
  }

  // final String uid = "";
  // // DatabaseService(this.uid);

//Profile
  Future<void> updateProfile(Map<String, dynamic> data) {
    final CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('students');
    // Call the user's CollectionReference to add a new user
    return studentCollection
        .doc(_uid)
        .update(data)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  fetchData() {
    final CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('students');
    // studentCollection.snapshots().listen((snapshot) {
    //   data = snapshot.docs.
    // });
    studentCollection
        .doc(_uid)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> firestoreInfo =
          documentSnapshot.data as Map<String, dynamic>;
      data = firestoreInfo;
      notifyListeners();
    }).onError((e) => print(e));
  }

  //Documents

  Future<void> uploadFile(File file) async {
    final FirebaseStorage storage =
        FirebaseStorage.instanceFor(bucket: "gs://edhub-26357.appspot.com");
    // Create a storage reference from our app
    var storageRef = storage.ref().child("$_uid");
    try {
      await storageRef.putFile(file);
    } on FirebaseException catch (e) {
      print("File not uploaded");
    }
  }
}
