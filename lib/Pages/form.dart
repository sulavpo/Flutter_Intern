import 'package:flutter/material.dart';

class TextForm {
  Widget formField(
      {required String fullname,
      required Icon icon,
      required TextEditingController type}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: TextFormField(
        controller: type,
        validator: (input) {
          if (input == "" || input == null) {
            return '$fullname cannot be empty';
          }
          return null;
        },
        textCapitalization: TextCapitalization.words,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          hintText: fullname,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(
                10,
              )),
          prefixIcon: icon,
        ),
      ),
    );
  }

  Widget passwordField(
      {required String fullname,
      required Icon icon,
      required TextEditingController type,
      required bool obscure,
      Widget? password}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: TextFormField(
        obscureText: obscure,
        controller: type,
        validator: (input) {
          if (input == "" || input == null) {
            return '$fullname cannot be empty';
          }
          return null;
        },
        textCapitalization: TextCapitalization.words,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            labelText: fullname,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(
                  10,
                )),
            prefixIcon: icon,
            suffixIcon: password),
      ),
    );
  }
}
