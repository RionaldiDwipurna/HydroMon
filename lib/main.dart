
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydromon/Common/routes.dart';
import 'package:hydromon/view/Logins/Login.dart';
import 'package:hydromon/view/Logins/LoginEmail.dart';
import 'package:hydromon/view/Registers/RegisterEmail.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null){
        print("User is signed out");
      } else{
        print('user is signed in');
      }
      print(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/': '/HomeScreen',
          onGenerateRoute: RouteGenerator.generateRoute,
    );

  }
}
