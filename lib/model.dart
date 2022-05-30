class DummyModel {
  String? fact;
  int? length;

  DummyModel({this.fact, this.length});

  DummyModel.fromJson(Map<String, dynamic> json) {
    fact = json['fact'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fact'] = fact;
    data['length'] = length;
    return data;
  }
}
