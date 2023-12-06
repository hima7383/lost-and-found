import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lost_and_found/backend_service/backend_exceptions.dart';
import 'package:lost_and_found/backend_service/inti.dart';

// return a Unique String
String unName() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}

// proccessing my image throw firebase storage convert to usable link
Future<String?> imageProcessing(XFile image1) async {
  await intialize();
  Reference refroot = FirebaseStorage.instance.ref();
  Reference currentDir = refroot.child("images");
  Reference imagetoupload = currentDir.child(unName());
  try {
    await imagetoupload.putFile(File(image1.path));
    String urlOfImage = await imagetoupload.getDownloadURL();
    return urlOfImage;
  } catch (e) {
    return null;
  }
}

//  i map everything and then send to fire store

Future<void> uploadpost(XFile? image1, String itemName, String itemDescription,
    String location) async {
  await intialize();
  if (image1 == null) {
    throw GenricException();
  }
  String? urlOfImage = await imageProcessing(image1);
  if (urlOfImage == null) {
    throw GenricException();
  }
  try {
    // create a refrence to fire storege path
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('lostandfound');
    String currentdatetime =
        DateFormat.yMEd().add_jms().format(DateTime.now()).toString();
    DateTime now = DateTime.now();

    Map<String, String> datatobesent = {
      'url': urlOfImage,
      'name': itemName,
      'description': itemDescription,
      'date': currentdatetime,
      'longdate': now.toString(),
      'location': location
    };
    collectionRef.add(datatobesent);
  } catch (e) {
    throw CouldNotUploadPostException();
  }
}

// return all posts as a list
Future<List<QueryDocumentSnapshot>> retriveall() async {
  await intialize();
  QuerySnapshot qsnapshot =
      await FirebaseFirestore.instance.collection('lostandfound').get();
  return qsnapshot.docs;
}

Future<QueryDocumentSnapshot> retrive_last_document() {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('lostandfound');
  return collectionRef.get().then((querySnapshot1) {
    return querySnapshot1.docs[0];
  });
}

// upadating existing post
Future<void> updatepost(String id, XFile? image1, String name,
    String describtion, String location) async {
  await intialize();
  if (image1 == null) {
    throw GenricException();
  }
  String? imageToBeUploadedUrl = await imageProcessing(image1);
  if (imageToBeUploadedUrl == null) {
    throw GenricException();
  }
  CollectionReference colref =
      FirebaseFirestore.instance.collection("lostandfound");
  try {
    String currentdatetime =
        DateFormat.yMEd().add_jms().format(DateTime.now()).toString();
    DateTime now = DateTime.now();
    await colref.doc(id).update(
      {
        'url': imageToBeUploadedUrl,
        'name': name,
        'description': describtion,
        'date': currentdatetime,
        'longdate': now.toString(),
        'location': location
      },
    );
  } catch (e) {
    throw CouldNotUpdatePostException();
  }
}

Future<void> deletepost(String id) async {
  await intialize();
  try {
    await FirebaseFirestore.instance
        .collection("lostandfound")
        .doc(id)
        .delete();
  } catch (e) {
    throw CouldNotDeletePostException();
  }
}

Future<void> deletepostfromhistory(String id, String url) async {
  await intialize();
  try {
    await FirebaseStorage.instance.refFromURL(url).delete();
    await FirebaseFirestore.instance
        .collection("lostandfoundhistory")
        .doc(id)
        .delete();
  } catch (e) {
    throw CouldNotDeletePostException();
  }
}

Future<List<QueryDocumentSnapshot>> retrivehistory() async {
  await intialize();
  QuerySnapshot qsnapshot =
      await FirebaseFirestore.instance.collection('lostandfoundhistory').get();
  return qsnapshot.docs;
}

Future<void> addhistory(
    String id,
    String image1,
    String itemName,
    String itemDescription,
    String location,
    String date,
    String nationalId,
    String? studentId,
    String fullName) async {
  await intialize();
  CollectionReference colref =
      FirebaseFirestore.instance.collection("lostandfoundhistory");
  await deletepost(id);

  String currentdatetime =
      DateFormat.yMEd().add_jms().format(DateTime.now()).toString();
  DateTime now = DateTime.now();
  Map<String, String?> datatobesent = {
    'url': image1,
    'name': itemName,
    'description': itemDescription,
    'foundate': date,
    'longdate': now.toString(),
    'location': location,
    'calmer_Nid': nationalId,
    'clamer_Sid': studentId,
    'clamer_name': fullName,
    'claimed_date': currentdatetime
  };
  colref.add(datatobesent);
}

Future<bool> check() async {
  await intialize();
  if (FirebaseAuth.instance.currentUser != null) {
    return true;
  } else {
    return false;
  }
}
