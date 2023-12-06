import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 51, 51),
        borderRadius: BorderRadius.circular(11),
      ),
      child: const Text(
        "Login",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
