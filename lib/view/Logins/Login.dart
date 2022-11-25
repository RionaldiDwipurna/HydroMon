import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Hydromon',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 50),
                  child: const Text(
                    'Monitoring Made Easy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(
                        color: const Color(0xFF4BC1B8),
                    )
                  ),

                  child:  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/LoginEmail');
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              Icons.email,
                              color: Color(0xFF039189),
                            ),
                          ),
                          const Text(
                            'Masuk dengan Email',
                            style: TextStyle(fontSize: 20, color: Color(0xFF039189)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                        color: const Color(0xFF4BC1B8),
                      )
                  ),

                  child:  GestureDetector(
                    onTap: (){},
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              Icons.email,
                              color: Color(0xFF039189),
                            ),
                          ),
                          const Text(
                            'Masuk dengan Akun Google',
                            style: TextStyle(fontSize: 20, color: Color(0xFF039189)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40,),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        'Belum punya akun? ',
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('/Register');
                        },
                        child: const Text(
                          'Daftar sekarang',
                          style: TextStyle(color: Color(0xFF039189), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
