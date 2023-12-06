import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.labelText, this.preIcon, required this.con, required this.dec});

  String? labelText;
  Icon? preIcon;
  bool dec;
  TextEditingController con = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: dec,
      controller: con,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.redAccent),
        prefixIcon: preIcon,
        prefixIconColor: Colors.redAccent,
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Colors.redAccent), //<-- SEE HERE
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Colors.redAccent), //<-- SEE HERE
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
