import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WaterTank extends StatefulWidget {
  const WaterTank({Key? key}) : super(key: key);

  @override
  State<WaterTank> createState() => _WaterTankState();
}

class _WaterTankState extends State<WaterTank> {
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
      home: Text('Test'),
    );
  }
}
