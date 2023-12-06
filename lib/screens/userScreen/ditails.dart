import 'package:flutter/material.dart';
import '../../componet/components.dart';

class Ditails extends StatefulWidget {
  const Ditails(
      {super.key,
      required this.itemName,
      required this.date,
      required this.location,
      required this.description,
      required this.imagelink});
  final String itemName;
  final String date;
  final String location;
  final String description;
  final String imagelink;
  @override
  State<Ditails> createState() => _DitailsState(this.itemName, this.date,
      this.location, this.description, this.imagelink);
}

class _DitailsState extends State<Ditails> {
  final String itemname;
  final String date;
  final String location;
  final String description;
  final String imagelink;
  _DitailsState(this.itemname, this.date, this.location, this.description,
      this.imagelink);

  TextEditingController TitleController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
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
                    labelText: 'Tiltle',
                    hintText: 'Enter the title',
                  ),
                ),
              ),
              //Date
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
                    labelText: 'Date',
                    hintText: 'Enter The date',
                  ),
                ),
              ),
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
