import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_part/Pages/dialouge_box.dart';
import 'package:flutter/material.dart';

class CustomRow {
  Widget customRow(
      {required String data,
      required String label,
      required String type,
      required BuildContext context}) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.blueGrey[500], borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label,
                style: const TextStyle(
                  color: Colors.white,
                )),
          ),
          Text(
            data,
            style: const TextStyle(color: Colors.black),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                doSomething(type: type);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                ShowDialouge().showDialouge(
                    city: "",
                    district: "",
                    provision: "",
                    text: label,
                    context: context,
                    data: data,
                    type: type,
                    text1: "",
                    text2: "",
                    text3: "");
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Widget customAddress(
      {required String city,
      required String type,
      required String district,
      required String provision,
      required BuildContext context}) {
    return Container(
      height: 40,
      width: 500,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.blueGrey[500], borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          padding("Address:", Colors.white),
          SizedBox(width: 3,),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 165,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  padding("$city,", Colors.black),
                  padding("$district,", Colors.black),
                  padding(provision, Colors.black),
                  // const Spacer(),
                 
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: IconButton(
                onPressed: () {
                  doSomething(type: type);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                )),
          ),
          IconButton(
              onPressed: () {
                ShowDialouge().showDialouge(
                    text: 'Address',
                    context: context,
                    data: "",
                    type: type,
                    text1: "City",
                    text2: "District",
                    text3: "Provision",
                    city: city,
                    provision: provision,
                    district: district);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Padding padding(String provision, Color colors) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5),
      child: Text(
        provision,
        style: TextStyle(color: colors),
      ),
    );
  }
}

void doSomething({required String type}) async {
  FirebaseDatabase.instance.ref("users/1").child(type).remove().then((value) {
    print("Sucessfully Deleted");
  });
}
