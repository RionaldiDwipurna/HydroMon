
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hydromon/model/UserData.dart';

class AuthUser{
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Users? _getUserFromFirebase(auth.User? user){
    return user != null ? Users(UID: user.uid) : null;
  }

  Future regisUser(String regisEmail, String regisPassword, String name) async{
    try{
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: regisEmail,
        password: regisPassword,
      );
      auth.User? user = result.user;
      await user?.updateDisplayName(name);

    }on auth.FirebaseAuthException catch (e){
      print(e);
      rethrow;

    }
  }
  // saveUserInfoToFirestore() async {
  //   var firebaseUser = auth.FirebaseAuth.instance.currentUser;
  //   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(firebaseUser?.uid).get();
  //
  //   if (!documentSnapshot.exists) {
  //     await FirebaseFirestore.instance.collection("users").doc(firebaseUser?.uid).set({
  //       "UID": firebaseUser?.uid,
  //       "profileName": _name,
  //       "email": firebaseUser.email,
  //       "timestamp": timestamp,
  //       "bio": ""
  //     });
  //     documentSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(firebaseUser?.uid)
  //         .get();
  //   }
  //   currentUser = Users.fromDocument(documentSnapshot); //currentUser is the instance of Users model class
  // }



  Future loginUser(String loginEmail, String loginPassword) async {
    try{
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: loginEmail,
        password: loginPassword,
      );
      auth.User? user = result.user;
      // print(result);
      return _getUserFromFirebase(user);
    } on auth.FirebaseAuthException catch (e){
      print(e);
      rethrow;
    }

  }


  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}