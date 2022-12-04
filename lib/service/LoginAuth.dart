

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:hydromon/model/UserData.dart';

class AuthUser{
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

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


  Future loginUser(String loginEmail, String loginPassword) async {
    try{
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: loginEmail,
        password: loginPassword,
      );
      auth.User? user = result.user;
      print(result);
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