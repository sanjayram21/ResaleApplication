import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> writeToCollection(String collectionName, Map<String, dynamic> data) async {
    final documentSnapshot = _firebaseFirestore.collection(collectionName);
    documentSnapshot.add(data);
    
  }

}

FirestoreServices firestoreServices = FirestoreServices();
