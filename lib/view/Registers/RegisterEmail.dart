import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydromon/service/LoginAuth.dart';

import '../../firebase_options.dart';


class RegisterEmail extends StatefulWidget {
  const RegisterEmail({Key? key}) : super(key: key);

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  var edtEMAIL = TextEditingController();
  var edtPASSW = TextEditingController();
  var edtNAME = TextEditingController();
  var edtCPASSW = TextEditingController();



  Future regisUser() async{
    String mssg = "";
    AuthUser registerUser = AuthUser();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>  const Center(child: CircularProgressIndicator(),)
    );
    try{
      await registerUser.regisUser(edtEMAIL.text.trim(), edtPASSW.text.trim(), edtNAME.text.trim());
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/Login');
    }on FirebaseAuthException catch (e){
      switch(e.code){
        case 'email-already-in-use':
          mssg = 'Email already in use';
          break;
        case 'invalid-email':
          mssg = 'Invalid email address';
          break;
        case 'operation-not-allowed':
          mssg = 'Operation not allowed';
          break;
        case 'weak-password':
          mssg = 'weak password';
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
        content:  Text('Failed to Register ' + mssg),
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

  void validate(String email, String password){



  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    edtCPASSW.dispose();
    edtEMAIL.dispose();
    edtPASSW.dispose();
    edtNAME.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    'Daftar Dengan Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Nama (4-20 Karakter)",
                        fillColor: Colors.white70),
                    controller: edtNAME,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Email",
                        fillColor: Colors.white70),
                    controller: edtEMAIL,
                  ),
                ),
                Container(
                  child: TextFormField(
                    enableSuggestions: false,
                    autocorrect: false,
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
                        hintText: "Password (Minimal 6 karakter)",
                        fillColor: Colors.white70),
                    controller: edtPASSW,
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  child: TextFormField(
                    enableSuggestions: false,
                    autocorrect: false,
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
                        hintText: "Ulangi Password",
                        fillColor: Colors.white70),
                    controller: edtCPASSW,
                  ),
                ),

                SizedBox(height: 40,),

                GestureDetector(
                  onTap: regisUser,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFA1DFD7),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child: const Text(
                      'Daftar ',
                      style: TextStyle(color: Color(0xFF4BC1B8), fontWeight: FontWeight.bold, fontSize: 14),
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
