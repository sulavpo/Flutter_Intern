import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_part/Pages/form.dart';
import 'package:flutter/material.dart';

class ShowDialouge {
  void showDialouge(
      {required String text,
      required String text1,
      required String text2,
      required String text3,
      required String city,
      required String district,
      required String provision,
      required String data,
      required String type,
      required BuildContext context}) {
    TextEditingController textContrl = TextEditingController();
    TextEditingController textContrl1 = TextEditingController();
    TextEditingController textContrl2 = TextEditingController();
    TextEditingController textContrl3 = TextEditingController();
    textContrl.text = data;
    textContrl1.text = city;
    textContrl2.text = district;
    textContrl3.text = provision;

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      if (city == "") {
                        doAnything(type: type, input: textContrl);
                        Navigator.pop(context);
                      } else {
                        doOnething(type: type,input1: textContrl1,input2: textContrl2,input3: textContrl3);
                         Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
              backgroundColor: Colors.blueGrey[50],
              content: SizedBox(
                  width: 100,
                  child: (city == '')
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(text),
                            TextForm().formField(
                                fullname: text,
                                icon: const Icon(Icons.edit),
                                type: textContrl)
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(text1),
                            TextForm().formField(
                                fullname: city,
                                icon: const Icon(Icons.edit),
                                type: textContrl1),
                            Text(text2),
                            TextForm().formField(
                                fullname: district,
                                icon: const Icon(Icons.edit),
                                type: textContrl2),
                            Text(text3),
                            TextForm().formField(
                                fullname: provision,
                                icon: const Icon(Icons.edit),
                                type: textContrl3),
                          ],
                        )),
            ));
  }
}

void doAnything(
    {required String type, required TextEditingController input}) async {
  FirebaseDatabase.instance
      .ref("users/1")
      .update({type: input.text}).then((value) {
    print("Sucessfully Updated");
  });
}

void doOnething({required TextEditingController input1,required String type,required TextEditingController input2,required TextEditingController input3}) async {
  FirebaseDatabase.instance.ref("users/1").update({
    type:{
      "city":input1.text,
      "district":input2.text,
      "provision":input3.text
    }
  }).then((value) {
    print("Sucessfully Updated");
  });
}
