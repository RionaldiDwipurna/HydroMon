import 'package:cloud_firestore/cloud_firestore.dart';

class Users{
  final String UID;
  final String userName;
  final String email;

  Users({
    this.UID = "",
    this.userName = "",
    this.email = ""
});


  factory Users.fromDocument(DocumentSnapshot doc){
        return Users(
          UID: doc["UID"] ?? "",
          userName: doc['userName'],
          email: doc['email']
        );
  }


}