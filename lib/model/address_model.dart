class FullAddress {
  final String city;
  final String district;
  final String provision;
  FullAddress(
      {required this.district, required this.city, required this.provision});
  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'district': district,
      'provision': provision,
    };
  }

  FullAddress.fromMap(Map<String, dynamic> addressMap)
      : city = addressMap["city"],
        district = addressMap["district"],
        provision = addressMap["provision"];
}
