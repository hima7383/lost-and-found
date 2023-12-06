import 'package:firebase_auth/firebase_auth.dart';
import 'package:lost_and_found/backend_service/backend_exceptions.dart';
import 'package:lost_and_found/backend_service/inti.dart';

Future<void> login(String email, String password) async {
  intialize();
  email = email.trim();
  password = password.trim();
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    throw WrongCredentailsAuthException();
  }
}

Future<void> logout() async {
  intialize();

  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    throw WrongCredentailsAuthException();
  }
}
