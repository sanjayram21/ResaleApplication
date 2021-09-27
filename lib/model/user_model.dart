import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  User user;
  
  UserModel(this.user);
}

UserModel? userModel;

initializeUserModel(User? user) {
  userModel = UserModel(user!);
}