import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vizeodevi/general/general_methods.dart';
import 'package:provider/provider.dart';
import 'package:vizeodevi/users/uyeler.dart';

class FlutterFireAuthService {
  final FirebaseAuth _firebaseAuth;

  FlutterFireAuthService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<User> createAccount(String adi, String adres, String telefon) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      User user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: adres, password: telefon))
          .user;

      if (user != null) {
        print("Account created succesfully");

        await _firestore
            .collection('users')
            .doc(_firebaseAuth.currentUser.uid)
            .set({
          "user_id": _firebaseAuth.currentUser.uid,
          "user_adi": adi,
          "user_adres": adres,
          "user_telefon": telefon,
        });

        return user;
      } else {
        print("Account creation failed");
        return user;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> logIn(String adres, String telefon, BuildContext context) async {
    try {
      User user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: adres, password: telefon))
          .user;
    } catch (e) {
      print(e);
      showAlert("Error!", e.toString(), context);
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    print("Log out icon clicked");
  }

  Future<dynamic> controlAuth() async {
    _firebaseAuth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        return [];
      } else {
        print('User is signed in!');
        print(user);
        return user;
      }
    });
  }
}
