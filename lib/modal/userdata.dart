class UserData {
  UserData();

  late final String id;
  late final String name;
  late final Data data;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    data = Data.fromJson(json['data'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data();

  late final String color;
  late final String capacity;
  late final String price;

  Data.fromJson(Map<String, dynamic> json) {
    color = json['color'] ?? '';
    capacity = json['capacity'] ?? '';
    price = json['price'].toString() ??' 0.0';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['color'] = color;
    _data['capacity'] = capacity;
    _data['price'] = price;
    return _data;
  }
}
