import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resale_application/model/user_model.dart';

class FirestoreServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> writeToCollection(
      String collectionName, Map<String, dynamic> data) async {
    final collectionReference = _firebaseFirestore.collection(collectionName);
    final collectionRef2 =
        collectionReference.doc(userModel!.user.uid).collection("items");
    collectionRef2.add(data);
  }

  Future<void> writeToProfileCollection(
      String collectionName, Map<String, dynamic> data) async {
    final collectionReference = _firebaseFirestore.collection(collectionName);
    await collectionReference.doc(userModel!.user.uid).set({
      'fullName': data['fullName'],
      'gradYear': data['gradYear'],
      'hostel': data['hostel'],
      'phoneNumber': data['phoneNumber']
    });
  }

  Future<List<Map<String, dynamic>>> readUserPost(String collectionName) async {
    List<Map<String, dynamic>> posts = [];
    final collectionReference = _firebaseFirestore.collection(collectionName);
    final collectionRef2 =
        collectionReference.doc(userModel!.user.uid).collection("items");
    final querySnapshot = await collectionRef2.get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      posts.add(querySnapshot.docs[i].data());
    }

    return posts;
  }

  Future<List<Map<String, dynamic>>> readAllPosts() async {
    List<Map<String, dynamic>> posts = [];
    final collectionReference = _firebaseFirestore.collection("users");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> doc = querySnapshot.docs;
    for (int i = 0; i < doc.length; i++) {
      final user = doc[i];
      // print(user.id);
      final itemsCollectionReference =
          collectionReference.doc(user.id).collection("items");
      final querySnapshot = await itemsCollectionReference.get();
      // print(querySnapshot.docs.length);
      // for (int j = 0; j < querySnapshot.docs.length; j++) {

      // }
      posts.addAll(querySnapshot.docs.map((item) {
        // print(item.data());
        return item.data();
      }));
    }
    // querySnapshot.docs.map((QueryDocumentSnapshot user) async {
    //   print(user.id);
    //   final itemsCollectionReference =
    //       collectionReference.doc(user.id).collection("items");
    //   final querySnapshot = await itemsCollectionReference.get();
    //   print(querySnapshot.docs.first.data());
    //   print(querySnapshot.docs.length);
    //   posts.addAll(querySnapshot.docs.map((item) {
    //     print(item.data());
    //     return item.data();
    //   }));
    // });

    return posts;
  }
}

FirestoreServices firestoreServices = FirestoreServices();
