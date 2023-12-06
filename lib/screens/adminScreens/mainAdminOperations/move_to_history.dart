import 'package:flutter/material.dart';
import 'package:lost_and_found/backend_service/backend_service.dart';
import 'package:lost_and_found/componet/components.dart';
import 'package:lost_and_found/screens/adminScreens/mainAdminScreens/listviewadmin.dart';
import 'package:image_picker/image_picker.dart';

class AddItemhistory extends StatefulWidget {
  final String id;
  final String image1;
  final String itemName;
  final String itemDescription;
  final String location;
  final String date;
  const AddItemhistory(
      {super.key,
      required this.id,
      required this.image1,
      required this.itemName,
      required this.itemDescription,
      required this.location,
      required this.date});

  @override
  State<AddItemhistory> createState() => _AddItemhistoryState(
      this.id,
      this.image1,
      this.itemName,
      this.itemDescription,
      this.location,
      this.date);
}

class _AddItemhistoryState extends State<AddItemhistory> {
  String id;
  String image1;
  String itemName;
  String itemDescription;
  String location;
  String date;
  _AddItemhistoryState(this.id, this.image1, this.itemName,
      this.itemDescription, this.location, this.date);
  TextEditingController natonalIdcontroller = TextEditingController();
  TextEditingController studentidcontorller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  XFile? imageFile;

  @override
  void initState() {
    natonalIdcontroller = TextEditingController();
    studentidcontorller = TextEditingController();
    fullnamecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    natonalIdcontroller.dispose();
    studentidcontorller.dispose();
    fullnamecontroller.dispose();
    DescriptionController.dispose();
  }

  Future<void> claim(
      String id,
      String image1,
      String itemName,
      String itemDescription,
      String location,
      String date,
      String nationalId,
      String? studentId,
      String fullName) async {
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
    await addhistory(id, image1, itemName, itemDescription, location, date,
        nationalId, studentId, fullName);
    // await uploadpost(image1, itemName, itemDescription, location);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => const Itemviewadmin(),
          settings: const RouteSettings(arguments: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maincolor,
        // Back arrow button in the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to prvious screen
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              //image box
              Container(
                margin: const EdgeInsets.only(
                    top: 50, bottom: 20, left: 35, right: 35),
                height: 320.0,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(child: Image.network(image1)),
              ),

              //title
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: natonalIdcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: 'National ID',
                    hintText: 'Enter National ID',
                  ),
                ),
              ),
              //Date
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: studentidcontorller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: 'Student ID',
                    hintText: 'Enter Student ID',
                  ),
                ),
              ),
              //location
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: fullnamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: 'Name',
                    hintText: 'Enter Claimer Name',
                  ),
                ),
              ),

              //Discription

              const SizedBox(
                height: 20,
              ),

              //Add buttom
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    claim(
                        id,
                        image1,
                        itemName,
                        itemDescription,
                        location,
                        date,
                        natonalIdcontroller.text,
                        DescriptionController.text,
                        fullnamecontroller.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text(
                    "Claim",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
