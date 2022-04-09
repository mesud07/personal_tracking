import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/usermodel.dart';

class ProfileService{

  FirebaseFirestore _firebaseFirestore =FirebaseFirestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<UserModel> getUser()async{
    String userUid = _firebaseAuth.currentUser!.uid;
var response = await _firebaseFirestore.collection('users').doc(userUid).get();
  UserModel user = UserModel.fromJson(response.data()!);
  
  return user;
  }

 
}