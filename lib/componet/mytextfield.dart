import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller1;
  final hinttext;
  final bool obsecuretext;

  const MyTextField(
      {super.key,
      required this.controller1,
      required this.hinttext,
      required this.obsecuretext});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller1,
        decoration: InputDecoration(
            hintText: hinttext,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true),
        enableSuggestions: false,
        obscureText: obsecuretext,
        autocorrect: false,
      ),
    );
  }
}
