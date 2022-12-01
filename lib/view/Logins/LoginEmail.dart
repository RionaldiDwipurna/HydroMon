import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/LoginAuth.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}


class _LoginEmailState extends State<LoginEmail> {
  bool _obscureText = true;
  var edtEMAIL = TextEditingController();
  var edtPASSW = TextEditingController();


  void  _toggle(){
    setState((){
      _obscureText = !_obscureText;
    });
  }
  Future loginUser() async {
    String mssg = "";
    authUser registerUser = authUser();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>  const Center(child: CircularProgressIndicator(),)
    );
    try{
      await registerUser.loginUser(edtEMAIL.text.trim(), edtPASSW.text.trim());
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/HomeScreen');
    } on FirebaseAuthException catch (e){
      switch(e.code){
        case 'wrong-password':
          mssg = 'Wrong password!';
          break;
        case 'invalid-email':
          mssg = 'Invalid email address';
          break;
        case 'user-disabled':
          mssg = 'User is disabled';
          break;
        case 'user-not-found':
          mssg = 'User not Found';
          break;
        default:
          print("gagal");
          break;
      }
      print(e);
      Navigator.of(context).pop();
      errorMsg(mssg);

    }
  }
  void errorMsg(String mssg){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Error'),
        content:  Text('Failed to Login ' + mssg),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      );
    }
    );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF039189),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top:20, bottom: 20),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Masuk Dengan Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: edtEMAIL,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Email",
                        fillColor: Colors.white70),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: edtPASSW,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Please enter some text';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Password",
                        fillColor: Colors.white70),
                  ),
                ),
                SizedBox(height: 40,),

                GestureDetector(
                  onTap: loginUser,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFA1DFD7),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Color(0xFF4BC1B8), fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(color: Color(0xFF4BC1B8), fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),

    );
  }
}
