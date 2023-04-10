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

  Data.fromJson(Map<String, dynamic> json) {
    color = json['color'] ?? '';
    capacity = json['capacity'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['color'] = color;
    _data['capacity'] = capacity;
    return _data;
  }
}
