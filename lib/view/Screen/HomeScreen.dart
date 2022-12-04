import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydromon/view/Screen/Profile.dart';
import 'package:hydromon/view/Screen/WaterTank.dart';

import '../../service/LoginAuth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  AuthUser authMethod = AuthUser();


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pageList = [
      const WaterTank(),
     const WaterTank(),
      const Profile()

  ];

  void logout() async{
    await authMethod.signOut();
    Navigator.of(context).pushNamed('/Login');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: logout,
            child: Icon(
            Icons.arrow_back,
            color: Color(0xFF039189),
        ),
          ),
          backgroundColor: Colors.white,
        ),
        body:pageList.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Water Tank'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}
