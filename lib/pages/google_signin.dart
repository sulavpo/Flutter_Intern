import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_firebase/pages/home_page.dart';
import 'package:dummy_firebase/pages/login_page.dart';
import 'package:dummy_firebase/pages/signup_page.dart';
import 'package:dummy_firebase/toasts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GogSign extends StatefulWidget {
  final ScreenArguments arguments;
  const GogSign({Key? key, required this.arguments}) : super(key: key);
  static const routeName = "/GogSignup-page";

  @override
  State<GogSign> createState() => _GogSignState();
}

class ImageModel {
  bool isFront;
  String imageUrl;
  ImageModel({required this.imageUrl, required this.isFront});
}

class _GogSignState extends State<GogSign> {
  Future<List<ImageModel>> uploadFile() async {
    final path1 = '/front/${pickedXfile3!.name}';
    final path2 = '/back/${pickedXfile4!.name}';
    List<ImageModel> images = [];
    // final file1 = File(pickedImage1!.path);
    // final file2 = File(pickedImage2!.path);

    final ref1 = FirebaseStorage.instance.ref().child(path1);
    await ref1.putFile(pickedImage3!);
    image3Url = await ref1.getDownloadURL();

    final ref2 = FirebaseStorage.instance.ref().child(path2);
    await ref2.putFile(pickedImage4!);
    image4Url = await ref2.getDownloadURL();
    images.add(ImageModel(imageUrl: image3Url!, isFront: true));
    images.add(ImageModel(imageUrl: image4Url!, isFront: false));
    return images;
    // final results = await File(pickedImage1!.path);
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  SingingCharacter? _character = SingingCharacter.male;
  String? selectedValue;
  String? image3Url;
  String? image4Url;
  bool hidePassword = true;
  bool hidePassword1 = true;
  late XFile? pickedXfile3, pickedXfile4;

  final _fokey = GlobalKey<FormState>();
  final emailText = TextEditingController();
  final address = TextEditingController();
  final fullname = TextEditingController();
  final passwordText = TextEditingController();
  final confirmPassword = TextEditingController();

  final List<String> documentItems = [
    "Citizenship card",
    "Driver's Licence",
    "Passport Page Photo"
  ];
  File? pickedImage3;
  File? pickedImage4;
  static Future<XFile?> _pickImage(ImageSource imageSource) async {
    return await ImagePicker().pickImage(source: imageSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _fokey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  'Just a Little More Step',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                child: TextFormField(
                  controller: fullname,
                  validator: (input) {
                    if (input == null || input == "") {
                      return 'Fullname  cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusColor: Colors.white,
                      labelText: 'Fullname',
                      fillColor: Colors.white,
                      suffixIconColor: Colors.white,
                      suffixIcon: const Icon(Icons.account_circle)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                child: TextFormField(
                  controller: address,
                  validator: (input) {
                    if (input == null || input == "") {
                      return 'Address  cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusColor: Colors.white,
                      labelText: 'Address',
                      fillColor: Colors.white,
                      suffixIconColor: Colors.white,
                      suffixIcon: const Icon(Icons.home)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                child: TextFormField(
                  controller: passwordText,
                  obscureText: hidePassword,
                  validator: (input) => input != null && input.length < 8
                      ? 'Password should be more than 8 '
                      : null,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.key,
                        color: Colors.black,
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                child: TextFormField(
                  controller: confirmPassword,
                  obscureText: hidePassword1,
                  // ignore: unrelated_type_equality_checks
                  validator: (input) => input != passwordText.text
                      ? 'Password doesnot match'
                      : null,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword1 = !hidePassword1;
                            });
                          },
                          icon: Icon(hidePassword1
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      labelText: ' Confirm Password',
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 8.0, right: 230.0),
                child: Text(
                  'Gender',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text(
                      'male',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.male,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'female',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.female,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Other',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.other,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          'Document Type:',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                          height: 50,
                          width: 150,
                          margin: EdgeInsets.only(top: 10),
                          child: DropdownButtonFormField(
                            items: documentItems
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an item';
                              }
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              '\t\t\t\t\t\t--Select here-- ',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 78.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      pickedXfile3 =
                                          await _pickImage(ImageSource.gallery);
                                      if (pickedXfile3 != null) {
                                        setState(() {
                                          pickedImage3 =
                                              File(pickedXfile3!.path);
                                        });
                                      }
                                    },
                                    child: Icon(Icons.photo)),
                                InkWell(
                                    onTap: () async {
                                      pickedXfile3 =
                                          await _pickImage(ImageSource.camera);
                                      if (pickedXfile3 != null) {
                                        setState(() {
                                          pickedImage3 =
                                              File(pickedXfile3!.path);
                                        });
                                      }
                                    },
                                    child: Icon(Icons.photo_camera))
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: (pickedImage3 != null)
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(pickedImage3!)
                                        as ImageProvider)
                                : null,
                          ),
                          height: 130,
                          width: 130,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 78.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      pickedXfile4 =
                                          await _pickImage(ImageSource.gallery);
                                      if (pickedXfile4 != null) {
                                        setState(() {
                                          pickedImage4 =
                                              File(pickedXfile4!.path);
                                        });
                                      }
                                    },
                                    child: Icon(Icons.photo)),
                                InkWell(
                                    onTap: () async {
                                      pickedXfile4 =
                                          await _pickImage(ImageSource.camera);
                                      if (pickedXfile4 != null) {
                                        setState(() {
                                          pickedImage4 =
                                              File(pickedXfile4!.path);
                                        });
                                      }
                                    },
                                    child: Icon(Icons.photo_camera))
                              ],
                            ),
                          ),
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: (pickedImage4 != null)
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(pickedImage4!)
                                        as ImageProvider)
                                : null,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Front View',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Back View',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_fokey.currentState!.validate()) {
                          _fokey.currentState!.save();
                          if (pickedImage3 != null && pickedImage4 != null) {
                            CollectionReference reference =
                                FirebaseFirestore.instance.collection("users");
                            String uid = _auth.currentUser!.uid;
                            List<ImageModel> images = await uploadFile();
                            reference
                                .doc(uid)
                                .set({
                                  'full_name': fullname.text,
                                  'address': address.text,
                                  'email': widget.arguments.email,
                                  'password': passwordText.text,
                                  'gender':
                                      _character.toString().split('.').last,
                                  'dc_type': selectedValue,
                                  'front_image': images[0].imageUrl,
                                  'back_image': images[1].imageUrl,
                                  'uid': uid
                                })
                                .then((value) => print("User Added"))
                                .catchError((error) =>
                                    print("Failed to add user: $error"));
                            Navigator.pushNamed(context, Homepage.routeName);
                          } else {
                            return Toasts.showToast(
                                "Please Select the Image", Colors.red);
                          }
                        }
                      },
                      child: Text('Signup'))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
