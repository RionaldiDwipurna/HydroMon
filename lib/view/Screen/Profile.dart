import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;

  List<Widget> pageList = [

  ];

  void logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamed('/Login');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Test2'),
    );
  }
}
