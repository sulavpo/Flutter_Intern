import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_part/Pages/signup_page.dart';
import 'package:firebase_part/model/data_model.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static const routeName = "/Landing-screen";

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Data>? stored;
  bool showData = false;
  bool hasData = false;

  Future<List<Data>> retrieveUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").get();
    // print(snapshot.docs);
    return snapshot.docs
        .map((docSnapshot) => Data.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  @override
  void didChangeDependencies() async {
    stored = await retrieveUsers();
    setState(() {
      hasData = true;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[600],
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 168.0, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Welcome to landing Page",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUp.routeName);
                      },
                      child: const Text("Logout")),
                  ElevatedButton(
                      onPressed: () {
                        print(retrieveUsers());
                        setState(() {
                          showData = true;
                        });
                      },
                      child: const Text("Press Me")),
                  Visibility(
                    visible: showData,
                    child: !hasData
                        ? const SizedBox()
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: stored!.length,
                            itemBuilder: ((context, index) {
                              return Text(stored![index].password);
                            })),
                  ),
                  Text(stored![0].fullname)
                  // Visibility(child: !hasData ? SizedBox():)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
