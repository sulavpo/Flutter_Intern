import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/apiservice.dart';

//finalToken is initalized
String? finalToken;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  //use for routing(i.e route handler)
  static const String routeName = "/home-page";


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //used for hiding and not hiding password if Visibility_off icon is pressed or not pressed
  bool hidePassword = true;
  //By using text controller the value input is stored in emailText
  final emailText = TextEditingController();
    //By using text controller the value input is stored in passwordText
  final passwordText = TextEditingController();
  String? token;

  //Mark:API Call
  callLoginApi() {
    final service = ApiService();
    service.apiCallLogin({
      "email": emailText.text,
      "password": passwordText.text,
    }, context).then((value) {
      //checking if the valie is or is not null
      if (value?.error != null) {
        print("get data >>>>>" + value!.error.toString());
      } else {
        print(value?.token);
      }
    });
  }

  //_formKey = GlobalKey<FormState>(); is used for TextFoemField
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      //Put Scrollable as a Single Child
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 120),
        //form widget should be used in textformfield
        child: Form(
          //key as _formhey
          key: _formKey,
          child: Column(
            children: [
              const Icon(
                Icons.account_box,
                size: 50,
              ),
              Text('Welcome Back', style: GoogleFonts.bebasNeue(fontSize: 50)),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You've been Missed",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        //used for input data in textformfield
                        controller: emailText,
                        //check validation by giving cretia in text form field
                        validator: (input) {
                          if (input == "" || input == null) {
                            return 'Email name cannot be empty';
                          }
                          return null;
                        },
                        decoration: (const InputDecoration(
                            border: InputBorder.none,
                            //Like a placeholder
                            hintText: 'Email',
                            //used for creating icon at right side
                            prefixIcon: Icon(Icons.email))),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        //used for input data in textformfield
                        controller: passwordText,
                         //check validation by giving cretia in text form field
                        obscureText: hidePassword,
                        validator: (input) => input != null && input.length < 3
                            ? 'Password should be more than 3 '
                            : null,
                        decoration: (InputDecoration(
                            border: InputBorder.none,
                            //used for creating icon at right side
                            suffixIcon: IconButton(
                              color: Colors.black.withOpacity(0.2),
                              //what will happen when the visibility button is pressed
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.key))),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      //to call the validation function(i.e to active validator)
                      if (_formKey.currentState!.validate()) {
                        //if all validation is done callLoginapi function
                        callLoginApi();
                      }
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
