import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/screens/userScreen/ditails.dart';

Widget mylistbuild(List<QueryDocumentSnapshot> ok) {
  return ListView.builder(
    itemCount: ok.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // here we have the list tile
            //adding more sup
            //adding more sup
            child: ListTile(
              horizontalTitleGap: 40,
              contentPadding: const EdgeInsets.all(20),
              title: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      ok[index]['url'],
                    ),
                  ),
                  const SizedBox(height: 15),
                  // row of information
                  // adding more sup
                  //adding more sup

                  Row(
                    children: [
                      Text(
                        "Name: ${ok[index]['name']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Description: ${ok[index]['description']}",
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.left),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Date Found: ${ok[index]['date']}",
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Ditails(
                                itemName: ok[index]['name'],
                                date: ok[index]['date'],
                                location: "yes",
                                description: ok[index]['description'],
                                imagelink: ok[index]['url'],
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "More Info",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
    },
  );
}
