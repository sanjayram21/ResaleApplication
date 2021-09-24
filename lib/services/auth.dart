import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential.toString();

  }
}
