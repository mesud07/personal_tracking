

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personaltracking/feature/allowingformPage/model/allowingModel.dart';

import '../../profilepage/view/profilepageview.dart';

class AllowingService{

  FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  setToPermission(BuildContext context,AllowingModel model)async{
      String? uid =_firebaseAuth.currentUser?.uid;
      final snack=SnackBar(
        content: Container(
          padding: EdgeInsets.all(5),
          child: Text("Formunuz başarıyla yüklendi"),));
          
          ScaffoldMessenger.of(context).showSnackBar(snack);
         await Future.delayed(Duration(milliseconds: 1000));
       await _firebaseFirestore.collection('users').doc(uid).update({
        'allowingList': FieldValue.arrayUnion([
          {
          'startTime':model.startTime,
          'endTime':model.endTime,
          'reason':model.reason,
          'isok':model.isok
          }
          ])
      }).whenComplete(() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>ProfilePage()), (route) => false) );

    
  }
}