import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydromon/model/TankData.dart';
import 'package:hydromon/model/UserData.dart';

import '../../service/TankDao.dart';

class WaterTank extends StatefulWidget {
  const WaterTank({Key? key}) : super(key: key);

  @override
  State<WaterTank> createState() => _WaterTankState();
}

class _WaterTankState extends State<WaterTank> {
  int _selectedIndex = 0;
  DatabaseReference anj =  FirebaseDatabase.instance.ref("FU17kqoykJawh3R26ehavKVMVkg2/data");

  final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C'];

  //



  DatabaseReference getData3(){
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var UID = firebaseUser?.uid;
    TankDao tankdata = TankDao(UID: UID.toString());
    DatabaseReference data = tankdata.getDatabaseRef();
    return data;
  }

  void logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamed('/Login');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child:  Text(
                  'HydroModules',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Center(child: Text('Dummy Card Text')),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Selected Device Data History',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              Container(
                height: 200,
                child: StreamBuilder(
                  stream: getData3().onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data!.snapshot.value);
                      TankData tankdata = TankData.fromJson(snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
                      return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Text('Module ${entries[index]}'),
                              subtitle: Text('Status: ${snapshot.data!.snapshot.value}'),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (ctx,int){
                    return Card(
                      child: ListTile(
                          title: Text('Motivation $int'),
                          subtitle: Text('this is a description of the motivation')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
