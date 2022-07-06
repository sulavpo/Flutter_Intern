import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_part/model/address_model.dart';

class Data {
  final String fullname;
  final FullAddress address;
  final String phone;
  final String mother;
  final String father;
  final String password;
  Data(this.fullname, this.address, this.phone, this.mother, this.father,
      this.password);
  Map<String, dynamic> toMap() {
    return {
      'name': fullname,
      'address': address.toMap(),
      'phone': phone,
      'mother': mother,
      'father': father,
      'password': password
    };
  }

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      parsedJson['name'].toString(),
      FullAddress.fromMap(parsedJson['address']),
      parsedJson['phone'].toString(),
      parsedJson['mother'].toString(),
      parsedJson['father'].toString(),
      parsedJson['password'].toString(),

    );
  }

  Data.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : fullname = doc.data()!["name"],
        address = FullAddress.fromMap(doc.data()!["address"]),
        phone = doc.data()!["phone"],
        mother = doc.data()!["mother"],
        father = doc.data()!["father"],
        password = doc.data()!["password"];
}
