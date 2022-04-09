import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:personaltracking/core/constants/string/profilePateStrings.dart';
import 'package:personaltracking/feature/profilepage/model/usermodel.dart';
import 'package:personaltracking/feature/scannerpage/model/inout_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerService{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  void comeInOut(BuildContext context,String? code,DateTime time,int inoutnumber)async{
   if( code=="data"){
      
      var uid =FirebaseAuth.instance.currentUser!.uid;
      print(uid.toString());
      String? type;
      
     if(inoutnumber%2==0){
       type="giriş";
     }else{
       type="çıkış";
     }
     
      await _firestore
          .collection("users")
          .doc(uid)
          .update({
        'inoutnumber':FieldValue.increment(1),
        'mesaiTakibi': FieldValue.arrayUnion([{
         'type': type.toString(),
         'time': time}]),
        
        
      }).whenComplete(()async {
         _showMaterialDialog(context,type!); 
         await Future.delayed(Duration(milliseconds: 2000));
         
         
         Navigator.pushNamedAndRemoveUntil(context, "/profilePage", (route) => false);
         
         });
      
   }else{

   }
  }


  getUser()async{
    var uid =FirebaseAuth.instance.currentUser!.uid;
   var response=await _firestore.collection('users').doc(uid).get();
  return UserModel.fromJson(response.data()!);
  }
}
void _showMaterialDialog(BuildContext context,String type) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(type +"başarıyla yapıldı")),
            content: Container(
              height: context.height/5,
              child: Image.asset(type=="giriş"?ProfilePageStrings.inAsset:ProfilePageStrings.outAsset,))
          
          );
        });
  }

