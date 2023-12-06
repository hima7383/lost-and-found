// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lost_and_found/adminAuth/admin_auth.dart';
import 'package:lost_and_found/backend_service/backend_exceptions.dart';
import 'package:lost_and_found/componet/custom_text_field.dart';
import 'package:lost_and_found/screens/adminScreens/mainAdminScreens/Admin_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<bool> securelogin(
      String email, String password, BuildContext context) async {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    try {
      await login(email, password);
      Navigator.pop(context);
    } on WrongCredentailsAuthException {
      Navigator.of(context).pop();
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 2),
          Image.asset('images/logo.png'),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              width: 400,
              height: 305,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 30,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 3,
                      color: Colors.grey)
                ],
              ),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  const Text(
                    "Login",
                    style: TextStyle(
                        color: Color.fromARGB(255, 231, 54, 54),
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                  const Spacer(flex: 7),
                  SizedBox(
                    width: 260,
                    child: CustomTextField(
                      dec: false,
                      con: email,
                      labelText: "Username",
                      preIcon: const Icon(Icons.people),
                    ),
                  ),
                  const Spacer(flex: 2),
                  SizedBox(
                    width: 260,
                    child: CustomTextField(
                      dec: true,
                      con: password,
                      labelText: "Password",
                      preIcon: const Icon(Icons.lock),
                    ),
                  ),
                  const Spacer(flex: 5),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        bool mover = await securelogin(
                            email.text, password.text, context);
                        if (mover == true) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const AdminPage()),
                              (Route<dynamic> route) => false);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Wrong credentails"),
                          ));
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
