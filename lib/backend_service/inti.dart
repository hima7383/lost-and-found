import 'package:firebase_core/firebase_core.dart';
import 'package:lost_and_found/firebase_options.dart';

Future<void> intialize() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
