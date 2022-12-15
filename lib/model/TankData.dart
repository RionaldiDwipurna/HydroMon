import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TankData{
  final String deviceID;
  final double waterLevel;
  final double tdsLevel;
  final String tankName;
  final double timeStamp;



  TankData({
    this.deviceID = "",
    this.waterLevel = 0,
    this.tdsLevel = 0,
    this.tankName = "",
    this.timeStamp = 0

  });


  factory TankData.fromJson(Map<dynamic,dynamic> json){
    double parser(dynamic source){
      try{
        return double.parse(source.toString());
      } on FormatException catch (e){
        print(e);
        return -1;
      }
    }
    return TankData(
        deviceID: json["deviceID"] ?? "",
        waterLevel: parser(json['level']),
        tdsLevel: parser(json['tds']),
        tankName: json['tankName'] ?? "",
        timeStamp: parser(json['timestamp'])
    );
  }


}