import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../profilepage/view/profilepageview.dart';

class LoginService {
  final _firabaseAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await _firabaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ProfilePage()),
          (route) => false);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('User not found');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password');
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future signIn(
      {required BuildContext context,
      required String? email,
      required String? password}) async {
    try {
      //Giriş Yapıldı
      await _firabaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ProfilePage()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Stream<User?> authStatus() {
    return _firabaseAuth.authStateChanges();
  }
}
