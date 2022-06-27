import 'dart:io';
// import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_firebase/constants/image.dart';
import 'package:dummy_firebase/pages/home_page.dart';
import 'package:dummy_firebase/pages/login_page.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

enum SingingCharacter { male, female, other }

class SignUp extends StatefulWidget {
  final ScreenArguments arguments;
  const SignUp({Key? key, required this.arguments}) : super(key: key);
  static const routeName = "/SignUp-page";

  @override
  State<SignUp> createState() => _SignUpState();
}

class ImageModel {
  bool isFront;
  String imageUrl;
  ImageModel({required this.imageUrl, required this.isFront});
}

class _SignUpState extends State<SignUp> {
  Future<List<ImageModel>> uploadFile() async {
    final path1 = '/front/${pickedXfile1!.name}';
    final path2 = '/back/${pickedXfile2!.name}';
    List<ImageModel> images = [];
    // final file1 = File(pickedImage1!.path);
    // final file2 = File(pickedImage2!.path);

    final ref1 = FirebaseStorage.instance.ref().child(path1);
    await ref1.putFile(pickedImage1!);
    image1Url = await ref1.getDownloadURL();

    final ref2 = FirebaseStorage.instance.ref().child(path2);
    await ref2.putFile(pickedImage2!);
    image2Url = await ref2.getDownloadURL();
    images.add(ImageModel(imageUrl: image1Url!, isFront: true));
    images.add(ImageModel(imageUrl: image2Url!, isFront: false));
    return images;
    // final results = await File(pickedImage1!.path);
  }
//   Future picker() async{
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

// if (result != null) {
//   Uint8List? fileBytes = result.files.first.bytes;
//   String fileName = result.files.first.name;

//   // Upload file
//   await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);
// }
//   }

  void showToast() {
    Fluttertoast.showToast(
        msg: "Please Select the images",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  SingingCharacter? _character = SingingCharacter.male;
  String? selectedValue;
  String? image1Url;
  String? image2Url;
  bool hidePassword = true;
  bool hidePassword1 = true;
  late XFile? pickedXfile1, pickedXfile2;

  final _fomkey = GlobalKey<FormState>();
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
  File? pickedImage1;
  File? pickedImage2;
  static Future<XFile?> _pickImage(ImageSource imageSource) async {
    return await ImagePicker().pickImage(source: imageSource);
  }

  @override
  void initState() {
    emailText.text = widget.arguments.email ?? '';
    fullname.text = widget.arguments.displayName ?? '';
    super.initState();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: SafeArea(
        child: Form(
          key: _fomkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 58.0, left: 20),
                  child: SvgPicture.asset(
                    AppImages.cash,
                    width: 150,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 20),
                  child: Text(
                    "Register Counter",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                  child: TextFormField(
                    controller: emailText,
                    validator: (input) {
                      if (input == null || input == "") {
                        return 'Email cannot be empty';
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
                        labelText: 'Email',
                        fillColor: Colors.white,
                        suffixIconColor: Colors.white,
                        suffixIcon: const Icon(Icons.mail)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Document Type:',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                            height: 50,
                            width: 150,
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
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                '\t\t\t\t\t\t--Select here-- ',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    )
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
                                    pickedXfile1 =
                                        await _pickImage(ImageSource.gallery);
                                    if (pickedXfile1 != null) {
                                      setState(() {
                                        pickedImage1 = File(pickedXfile1!.path);
                                      });
                                    }
                                  },
                                  child: Icon(Icons.photo)),
                              InkWell(
                                  onTap: () async {
                                    pickedXfile1 =
                                        await _pickImage(ImageSource.camera);
                                    if (pickedXfile1 != null) {
                                      setState(() {
                                        pickedImage1 = File(pickedXfile1!.path);
                                      });
                                    }
                                  },
                                  child: Icon(Icons.photo_camera))
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: (pickedImage1 != null)
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      FileImage(pickedImage1!) as ImageProvider)
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
                                    pickedXfile2 =
                                        await _pickImage(ImageSource.gallery);
                                    if (pickedXfile2 != null) {
                                      setState(() {
                                        pickedImage2 = File(pickedXfile2!.path);
                                      });
                                    }
                                  },
                                  child: Icon(Icons.photo)),
                              InkWell(
                                  onTap: () async {
                                    pickedXfile2 =
                                        await _pickImage(ImageSource.camera);
                                    if (pickedXfile2 != null) {
                                      setState(() {
                                        pickedImage2 = File(pickedXfile2!.path);
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
                          image: (pickedImage2 != null)
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      FileImage(pickedImage2!) as ImageProvider)
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
                      if (_fomkey.currentState!.validate()) {
                        _fomkey.currentState!.save();
                        if (pickedImage1 != null && pickedImage2 != null) {
                          List<ImageModel> images = await uploadFile();
                          users
                              .add({
                                'full_name': fullname.text,
                                'address': address.text,
                                'email': emailText.text,
                                'password': passwordText.text,
                                'gender': _character.toString().split('.').last,
                                'dc_type': selectedValue,
                                'front_image': images[0].imageUrl,
                                'back_image': images[1].imageUrl,

                                      // or also can be written as 
                                // 'front_image': images
                                //     .where((element) => element.isFront)
                                //     .first
                                //     .imageUrl,
                                // 'back_image': images
                                //     .where((element) => !element.isFront)
                                //     .first
                                //     .imageUrl,
                              })
                              .then((value) => print("User Added"))
                              .catchError((error) =>
                                  print("Failed to add user: $error"));
                          Navigator.pushNamed(context, Homepage.routeName);
                        } else {
                          return showToast();
                        }
                      }
                    },
                    child: Text('SignUp'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
