import 'dart:io';

import 'package:ecommerce/Constants/image.dart';
import 'package:ecommerce/Pages/selfie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);
  static const routeName = "/next-page";

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  // String? file = "cc";

  final List<String> documentItems = [
    "Citizenship card",
    "Driver's Licence",
    "Passport Page Photo"
  ];

  String? selectedValue;

  final _fmKey = GlobalKey<FormState>();

  File? pickedImage1;
  File? pickedImage2;
  static Future<XFile?> _pickImage(ImageSource imageSource) async {
    return await ImagePicker().pickImage(source: imageSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _fmKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        Text(
                          '2/3',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 130, top: 25),
                  child: Text('Take a photo',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 160, top: 5),
                  child: Text('of your ID',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, top: 15, bottom: 15),
                  child: SvgPicture.asset(
                    AppImages.camera,
                    width: 150,
                    height: 150,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 22, right: 22, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Document Type:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                '\t\t\t\tSelect the Document Type',
                                style: TextStyle(fontSize: 13),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
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
                                  return 'Please select document type.';
                                }
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                              onChanged: (value) {}),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 8.0),
                              child: InkWell(
                                onTap: () async {
                                  XFile? file =
                                      await _pickImage(ImageSource.gallery);
                                  if (file != null) {
                                    setState(() {
                                      pickedImage1 = File(file.path);
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.image,
                                  size: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 35),
                              child: Container(
                                height: 30,
                                width: 30,
                                child: InkWell(
                                    onTap: () async {
                                      XFile? file =
                                          await _pickImage(ImageSource.camera);
                                      if (file != null) {
                                        setState(() {
                                          pickedImage1 = File(file.path);
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.camera,
                                      size: 25,
                                    )),
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle),
                              ),
                            )
                          ],
                        ),
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration(
                            image: (pickedImage1 != null)
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(pickedImage1!)
                                        as ImageProvider)
                                : null,
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 8.0),
                              child: InkWell(
                                onTap: () async {
                                  XFile? file =
                                      await _pickImage(ImageSource.gallery);
                                  if (file != null) {
                                    setState(() {
                                      pickedImage2 = File(file.path);
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.image,
                                  size: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 35),
                              child: Container(
                                height: 30,
                                width: 30,
                                child: InkWell(
                                    onTap: () async {
                                      XFile? file =
                                          await _pickImage(ImageSource.camera);
                                      if (file != null) {
                                        setState(() {
                                          pickedImage2 = File(file.path);
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.camera,
                                      size: 25,
                                    )),
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle),
                              ),
                            )
                          ],
                        ),
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            image: (pickedImage2 != null)
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(pickedImage2!)
                                        as ImageProvider)
                                : null,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text("Front View"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: Text("Back View"),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 87, 151, 203))),
                      onPressed: (() {
                        setState(() {
                          if (_fmKey.currentState!.validate()) {
                            Navigator.pushNamed(context, SelfieClick.routeName);
                          }
                        });
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Row(
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                            )
                          ],
                        ),
                      )),
                ),
              ]),
            ),
          ),
        ));
  }
}
