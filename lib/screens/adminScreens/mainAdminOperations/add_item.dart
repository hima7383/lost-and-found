import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lost_and_found/backend_service/backend_service.dart';
import 'package:lost_and_found/componet/components.dart';
import 'package:image_picker/image_picker.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  XFile? imageFile;

  @override
  void initState() {
    TitleController = TextEditingController();
    DescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    TitleController.dispose();
    DateController.dispose();
    locationController.dispose();
    DescriptionController.dispose();
  }

  Future<void> Add(XFile? image1, String itemName, String itemDescription,
      String location) async {
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

    await uploadpost(image1, itemName, itemDescription, location);

    Navigator.of(context).pop();
  }

  showOption(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Chose"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.image),
                      title: const Text("Gallary"),
                      onTap: () => imageFromGallary(context),
                    ),
                    ListTile(
                      leading: const Icon(Icons.camera),
                      title: const Text("Camera"),
                      onTap: () => imageFromCamera(context),
                    ),
                  ],
                ),
              ),
            ));
  }

  Future imageFromGallary(BuildContext context) async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image;
    });
    Navigator.pop(context);
  }

  Future imageFromCamera(BuildContext context) async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image;
    });
    Navigator.pop(context);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => showOption(context),
        child: const Icon(Icons.add_photo_alternate),
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
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: imageFile != null
                        ? Image.file(
                            File(imageFile!.path),
                            width: 400,
                            height: 300,
                          )
                        : const Text("Add image"),
                  )),

              //title
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: TitleController,
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
                    labelText: 'Tiltle',
                    hintText: 'Enter the title',
                  ),
                ),
              ),
              //Date

              //location
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: locationController,
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
                    labelText: 'Location',
                    hintText: 'Enter the location',
                  ),
                ),
              ),

              //Discription
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: DescriptionController,
                      maxLines: null,
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
                        labelText: 'Description',
                        hintText: 'Item Description',
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              //Add buttom
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    await Add(imageFile, TitleController.text,
                        DescriptionController.text, locationController.text);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text(
                    "ADD",
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
