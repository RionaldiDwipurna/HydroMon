import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterTank extends StatefulWidget {
  const WaterTank({Key? key}) : super(key: key);

  @override
  State<WaterTank> createState() => _WaterTankState();
}

class _WaterTankState extends State<WaterTank> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Berhasil Masuk"),
    );
  }
}
