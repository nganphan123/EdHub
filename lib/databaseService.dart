import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);
  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('students');

//Profile
  Future<void> updateProfile(Map<String, dynamic> data) {
    // Call the user's CollectionReference to add a new user
    return studentCollection
        .doc(uid)
        .update(data)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //Documents
  final FirebaseStorage storage =
      FirebaseStorage.instanceFor(bucket: "gs://edhub-26357.appspot.com");
  Future<void> uploadFile(File file) async {
    // Create a storage reference from our app
    var storageRef = storage.ref().child("$uid");
    try {
      await storageRef.putFile(file);
    } on FirebaseException catch (e) {
      print("File not uploaded");
    }
  }
}
