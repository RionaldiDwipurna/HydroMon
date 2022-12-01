

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authUser{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future regisUser(String regisEmail, String regisPassword, String name) async{
    String mssg = "";
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: regisEmail,
        password: regisPassword,
      );
      User? user = result.user;
      await user?.updateDisplayName(name);


    }on FirebaseAuthException catch (e){
      print(e);
      rethrow;

    }
  }


  Future loginUser(String loginEmail, String loginPassword) async {
    try{
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: loginEmail,
        password: loginPassword,
      );
      print(userCredential);
    } on FirebaseAuthException catch (e){
      rethrow;
      print(e);
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