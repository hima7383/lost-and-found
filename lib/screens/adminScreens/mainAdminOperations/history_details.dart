import 'package:flutter/material.dart';
import 'package:lost_and_found/componet/components.dart';

class Ditailshistory extends StatefulWidget {
  const Ditailshistory(
      {super.key,
      required this.itemName,
      required this.date,
      required this.location,
      required this.description,
      required this.imagelink,
      required this.fullname,
      required this.nationalid,
      required this.studentId,
      required this.claimedDate});
  final String itemName;
  final String date;
  final String location;
  final String description;
  final String imagelink;
  final String fullname;
  final String nationalid;
  final String studentId;
  final String claimedDate;
  @override
  State<Ditailshistory> createState() => _DitailshistoryState(
      this.itemName,
      this.date,
      this.location,
      this.description,
      this.imagelink,
      this.fullname,
      this.nationalid,
      this.studentId,
      this.claimedDate);
}

class _DitailshistoryState extends State<Ditailshistory> {
  final String itemname;
  final String date;
  final String location;
  final String description;
  final String imagelink;
  final String fullname;
  final String nationalid;
  final String studentId;
  final String claimedDate;
  _DitailshistoryState(
      this.itemname,
      this.date,
      this.location,
      this.description,
      this.imagelink,
      this.fullname,
      this.nationalid,
      this.studentId,
      this.claimedDate);

  TextEditingController TitleController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController studentidController = TextEditingController();
  TextEditingController claimedDateController = TextEditingController();
  // Declare a variable to store the updated image file
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    //get data from database
    setState(() {
      //get data from  the database and show it int textfields
      TitleController.text = itemname;
      DateController.text = date;
      locationController.text = location;
      DescriptionController.text = description;
      fullnameController.text = fullname;
      nationalIdController.text = nationalid;
      studentidController.text = studentId;
      claimedDateController.text = claimedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maincolor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imagelink,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  readOnly: true,
                  controller: DateController,
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
                    labelText: 'Found Date',
                    hintText: 'Enter The date',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  readOnly: true,
                  controller: claimedDateController,
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
                    labelText: 'Claimed Date',
                    hintText: '',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  readOnly: true,
                  controller: fullnameController,
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
                    labelText: 'Claimer_name',
                    hintText: '',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  readOnly: true,
                  controller: nationalIdController,
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
                    labelText: 'NationalId',
                    hintText: '',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  readOnly: true,
                  controller: studentidController,
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
                    labelText: 'StudentId',
                    hintText: '',
                  ),
                ),
              ),
              //title
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  readOnly: true,
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
                    labelText: 'Item name',
                    hintText: 'Enter the title',
                  ),
                ),
              ),
              //Date

              //location
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  readOnly: true,
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
                      readOnly: true,
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
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue, // Adjust the color as needed
        onTap: (index) {
          // Handle navigation based on the tapped index
          setState(() {
            _currentIndex = index;
            // Implement your actions for WhatsApp and Facebook here
            if (index == 0) {
              // WhatsApp action
            } else if (index == 1) {
              // Facebook action
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot), // WhatsApp icon
            label: 'WhatsApp',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.facebook), // Facebook icon
            label: 'Facebook',
          ),
        ],
      ),
    );
  }
}
