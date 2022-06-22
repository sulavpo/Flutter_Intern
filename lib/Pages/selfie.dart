import 'dart:io';

import 'package:ecommerce/Constants/image.dart';
import 'package:ecommerce/Pages/home_page.dart';
import 'package:ecommerce/Pages/login_page.dart';
// import 'package:ecommerce/Pages/login_page.dart';
// import 'package:ecommerce/Pages/next_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SelfieClick extends StatefulWidget {
  const SelfieClick({Key? key}) : super(key: key);
  static const routeName = "/selfie-click";

  @override
  State<SelfieClick> createState() => _SelfieClickState();
}

class _SelfieClickState extends State<SelfieClick> {
  bool agree = false;
  void _doSomething() {
    Navigator.pushNamed(context, HomePage.routeName);
  }
  void showToast() {  
    Fluttertoast.showToast(
        msg: "Select I agree to continue",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }  

  File? pickedImage3;
  bool isChecked = false;
  static Future<XFile?> _pickImage(ImageSource imageSource) async {
    return await ImagePicker().pickImage(source: imageSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  Text(
                    '3/3',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 45, top: 10),
              child: Text('Verify Your Identity',
                  style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            SvgPicture.asset(
              AppImages.id,
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80,right: 80),
              child: Container(
                child: Text(
                  '\tA Picture of the document and your selfie will be checked',
                  style: TextStyle(fontSize: 14),textAlign: TextAlign.left
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value ?? false;
                        });
                      }),

                  // Checkbox(
                  //     checkColor: Colors.white,
                  //     value: isChecked,
                  //     onChanged: (bool? value) {
                  //       setState(() {
                  //         isChecked = value!;
                  //       });
                  //     }),
                  RichText(
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.end,
                      textDirection: TextDirection.rtl,
                      softWrap: true,
                      maxLines: 2,
                      textScaleFactor: 1,
                      text: TextSpan(
                          text:
                              "By agree and confirm to have read and accepted \nthe ",
                          style:
                              TextStyle(color: Colors.black, fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                                text: "T&Cs and data policy",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 12),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _showDialouge();
                                  })
                          ])),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(76, 175, 80, 1))),
                  onPressed: (() {
                    setState(() {
                      _showDialog();
                    });
                  }),
                  child: const Center(
                      child: Text(
                    'Take A selfie',
                    style: TextStyle(fontSize: 15),
                  ))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
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
                    agree ? _doSomething() : showToast();
                  }),
                  child: const Center(
                      child: Text(
                    'Finish',
                    style: TextStyle(fontSize: 15),
                  ))),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: (pickedImage3 != null)
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(pickedImage3!) as ImageProvider)
                        : null,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              content: SizedBox(
                child: Column(children: [
                  Text(
                    'Smile You are on camera',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: (pickedImage3 != null)
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      FileImage(pickedImage3!) as ImageProvider)
                              : null,
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(left: 60, right: 60)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 87, 151, 203))),
                        onPressed: (() async {
                          XFile? file = await _pickImage(ImageSource.camera);
                          if (file != null) {
                            setState(() {
                              pickedImage3 = File(file.path);
                            });
                          }
                        }),
                        child: Text(
                          'Touch to Click',
                          style: TextStyle(fontSize: 15),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(left: 85, right: 85)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(76, 175, 80, 1))),
                        onPressed: (() async {
                          XFile? file = await _pickImage(ImageSource.camera);
                          if (file != null) {
                            setState(() {
                              pickedImage3 = File(file.path);
                            });
                          }
                        }),
                        child: Text(
                          'Retake',
                          style: TextStyle(fontSize: 15),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ]),
                height: 350,
                width: 50,
              ),
            );
          });
        });
  }

  void _showDialouge() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: 500,
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                          "1. By using the MyMobileApp.online \n website or any of the My Mobile\n App mobile apps services, you are agreeing to be bound by\n the following terms and conditions",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Text(
                        "2.The definition of “The Client” used in this document pertains at all times to the\n organization that is the intended party requesting apps from My Mobile App.",
                        style: TextStyle(fontSize: 15)),
                    Text(
                        "3.The Client is responsible for maintaining the security of their online account and password.",
                        style: TextStyle(fontSize: 15)),
                    Text(
                        "4. By using My Mobile App, The Client asserts itself to have ownership and license,or some other clearn right, to enter the Agreement on behalf of the website submitted to My Mobile App. In the event that the right to enter the Agreement is shown to be non existent, or a competing claim of right is proven to be stronger, Appswiz reserves the right to remove the application from its systems, or alter the"),
                    Padding(
                      padding: const EdgeInsets.only(left: 130.0, top: 10),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Ok',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
