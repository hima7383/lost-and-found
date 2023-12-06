import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/backend_service/backend_service.dart';
import 'package:lost_and_found/componet/list_builder_history.dart';

class Itemviewhistory extends StatefulWidget {
  const Itemviewhistory({super.key});

  @override
  State<Itemviewhistory> createState() => _ItemviewhistoryState();
}

class _ItemviewhistoryState extends State<Itemviewhistory> {
  List<QueryDocumentSnapshot> ok = [];
  late final TextEditingController email;
  late final TextEditingController pass;
  final String hinttext = "Enter your email";
  DateTime old = DateTime.now();
  StreamController<List<QueryDocumentSnapshot>> _dataStreamController =
      StreamController<List<QueryDocumentSnapshot>>.broadcast();

  @override
  void initState() {
    old = DateTime(old.year - 50, old.month, old.day);
    old = DateTime(old.year - 50, old.month, old.day);
    email = TextEditingController();
    pass = TextEditingController();
    _dataStreamController = StreamController<List<QueryDocumentSnapshot>>();
    p();

    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
    _dataStreamController.close();
  }

  Future<void> streamsrest() async {
    _dataStreamController.close();
    _dataStreamController = StreamController<List<QueryDocumentSnapshot>>();
    _dataStreamController.add(await retrivehistory());
    setState(() {});
  }

  Future<void> p() async {
    _dataStreamController.add(await retrivehistory());
  }

  Future<void> addnewitem() async {
    if (ModalRoute.of(context)!.settings.arguments == 1) {
      setState(() async {
        _dataStreamController
            .add(await retrive_last_document() as List<QueryDocumentSnapshot>);
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(510, 239, 236, 236),
      appBar: AppBar(
        title: const Text(
          "Oi Find",
          style: TextStyle(
              color: Colors.white, fontFamily: AutofillHints.birthday),
        ),
        backgroundColor: const Color.fromARGB(255, 120, 12, 4),
        leading: IconButton(
          icon: const Icon(Icons.filter_alt),
          onPressed: () async {
            return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Filter for the last..."),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text("day"),
                              onTap: () {
                                DateTime now = DateTime.now();
                                old = now.subtract(const Duration(days: 1));
                                setState(() {});
                              },
                            ),
                            ListTile(
                              title: const Text("3 days"),
                              onTap: () {
                                DateTime now = DateTime.now();
                                old = now.subtract(const Duration(days: 3));
                                setState(() {});
                              },
                            ),
                            ListTile(
                              title: const Text("week"),
                              onTap: () {
                                DateTime now = DateTime.now();
                                old = now.subtract(const Duration(days: 7));
                                setState(() {});
                              },
                            ),
                            ListTile(
                              title: const Text("3 weeks"),
                              onTap: () {
                                DateTime now = DateTime.now();
                                old = now.subtract(const Duration(days: 14));
                                setState(() {});
                              },
                            ),
                            ListTile(
                              title: const Text("Reset"),
                              onTap: () {
                                DateTime now = DateTime.now();
                                old = old =
                                    DateTime(now.year - 50, now.month, now.day);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            iconSize: 35.0,
            onPressed: () {
              showSearch(
                context: context,
                delegate: Searching(ok),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<QueryDocumentSnapshot>>(
        stream: _dataStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            ok = snapshot.data as List<QueryDocumentSnapshot>;
            ok = ok.reversed.toList();
            ok = snapshot.data!.where(
              (element) {
                Map<String, dynamic> data =
                    element.data() as Map<String, dynamic>;
                DateTime datanow = DateTime.parse(data['longdate']);
                DateTime currentdate = DateTime.now();
                if (datanow.isAfter(old) && datanow.isBefore(currentdate)) {
                  return true;
                } else {
                  return false;
                }
              },
            ).toList();
            return RefreshIndicator(
                onRefresh: streamsrest, child: mylistbuildhistory(ok));
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

// searching logic
class Searching extends SearchDelegate {
  List<QueryDocumentSnapshot> items = [];
  Searching(this.items);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        return close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<QueryDocumentSnapshot> result = [];
    for (var s in items) {
      var data = s.data() as Map<String, dynamic>;

      if (data['name']!.toLowerCase().contains(query.toString().toLowerCase()) |
          data['description']!
              .toLowerCase()
              .contains(query.toString().toLowerCase())) {
        result.add(s);
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(510, 239, 236, 236),
      body: mylistbuildhistory(result),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    late List<QueryDocumentSnapshot> result = [];
    for (var s in items) {
      var data = s.data() as Map<String, dynamic>;

      if (data['name']!.toLowerCase().contains(query.toString().toLowerCase()) |
          data['description']!
              .toLowerCase()
              .contains(query.toString().toLowerCase())) {
        result.add(s);
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(510, 239, 236, 236),
      body: mylistbuildhistory(result),
    );
  }
}
