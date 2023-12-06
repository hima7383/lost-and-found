import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CusBtn extends StatelessWidget {
  CusBtn({this.txt});
  String? txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          // Add your on pressed event here
          print("fvnjncvm ldfmblkmfdlk vkldfmv'sdmdm");
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text("xt",
            style: TextStyle(
                fontSize: 35, color: Colors.red, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
