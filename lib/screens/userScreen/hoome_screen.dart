import 'package:flutter/material.dart';
import 'package:lost_and_found/componet/components.dart';
import 'package:lost_and_found/screens/adminScreens/mainAdminScreens/login_page.dart';

import 'package:lost_and_found/screens/userScreen/itemview.dart';

class Hoome_screen extends StatefulWidget {
  const Hoome_screen({super.key});

  @override
  State<Hoome_screen> createState() => _Hoome_screenState();
}

class _Hoome_screenState extends State<Hoome_screen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //appBar: AppBar(),
      body: SafeArea(
        //to remove the overload error
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // background image
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/p2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/scpart.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),

                      // text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Welcome to lostapp",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // text 2
                      const Positioned(
                        left: 60,
                        child: Text(
                          "are you looking for somthing",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 0,
                          width: 5,
                          transformAlignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: maincolor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),

                      // find your item ElevatedButton
                      Container(
                        width: 300,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Itemview()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maincolor,
                            elevation: 4,
                          ),
                          child: const Text(
                            'Find your Item',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      // Admin ElevatedButton
                      Container(
                        width: 300,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Login()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maincolor,
                            elevation: 4,
                          ),
                          child: const Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.whatshot), // WhatsApp icon
            label: 'WhatsApp',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.facebook), // Facebook icon
            label: 'Facebook',
          ),
        ],
      ),
    );
  }
}
