import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_firebase/pages/login_page.dart';
import 'package:dummy_firebase/toasts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Homepage extends StatefulWidget {
  // final String documentId;

  // const Homepage({Key? key,required this.documentId}) : super(key: key);
  static const routeName = "/Home-Page";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // CollectionReference _collectionRef =
  //     FirebaseFirestore.instance.collection('users');
  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _collectionRef.get();
  //   print(querySnapshot.docs);
  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   print(allData);

  // }
  Future<void> getData() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["email"]);
      });
      return querySnapshot;
    });

    //     var data = snap.docs.first.data();
    // print(snap.docs.any((element) => uid == element.));
    // return snap.docs.any((element) => uid == element.id);
  }

  @override
  void initState() {
    Toasts.showToast("Welcome", Colors.yellow);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async{
                    await getData();
                    },
                    child: Text('press me')),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber)),
                  onPressed: () {
                    GoogleSignIn().disconnect();
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    });
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        )
        // body: FutureBuilder<DocumentSnapshot>(
        //   //Fetching data from the documentId specified of the student
        //   future: users.doc(widget.documentId).get(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //     //Error Handling conditions
        //     if (snapshot.hasError) {
        //       return Text("Something went wrong");
        //     }

        //     if (snapshot.hasData && !snapshot.data!.exists) {
        //       return Text("Document does not exist");
        //     }

        //     //Data is output to the user
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       Map<String, dynamic> data =
        //           snapshot.data!.data() as Map<String, dynamic>;
        //       return Center(child: Text("Full Name: ${data['full_name']} ${data['email']}"));
        //     }

        //     return Text("loading");
        //   },
        // ),
        );
  }
}
