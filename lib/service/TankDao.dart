
import 'package:firebase_database/firebase_database.dart';

class TankDao{
  final String UID;
  late final databaseReference;

  TankDao({required this.UID}){
   this.databaseReference =  FirebaseDatabase.instance.ref("$UID/data");

  }
  //read stream data from firebase realtime database
  Stream getData() async* {

    yield databaseReference.onValue;

  }

  getDatabaseRef(){
    return databaseReference;
  }


  void readData(){
    print(UID);

    databaseReference.once().then((event) {
      final dataSnapshot = event.snapshot;
      print('Data : ${dataSnapshot.value}');
    });
  }






}