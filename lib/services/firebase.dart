import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resale_application/model/user_model.dart';

class FirestoreServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> writeToCollection(String collectionName, Map<String, dynamic> data) async {
    final collectionReference = _firebaseFirestore.collection(collectionName);
    final collectionRef2 = collectionReference.doc(userModel!.user.uid).collection("items");
    collectionRef2.add(data);
  }

  Future<void> writeToProfileCollection(String collectionName, Map<String, dynamic> data) async {
    final collectionReference = _firebaseFirestore.collection(collectionName);
    await collectionReference.doc(userModel!.user.uid).set({
      'fullName': data['fullName'],
      'gradYear': data['gradYear'],
      'hostel': data['hostel'],
      'phoneNumber': data['phoneNumber']
    });
  }

}

FirestoreServices firestoreServices = FirestoreServices();
