import 'package:flutter/material.dart';
import 'package:hydromon/view/Logins/LoginEmail.dart';
import 'package:hydromon/view/Registers/RegisterEmail.dart';

import '../view/Logins/Login.dart';
import '../view/Registers/Register.dart';
import '../view/Screen/HomeScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/Login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/LoginEmail':
        return MaterialPageRoute(builder: (_) => LoginEmail());
      case '/Register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/RegisterEmail':
        return MaterialPageRoute(builder: (_) => RegisterEmail());
      case '/HomeScreen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
    // return MaterialPageRoute(builder: (_) => AboutPage(args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }

}