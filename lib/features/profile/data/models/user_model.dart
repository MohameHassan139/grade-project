class User {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? image;

  User({this.id, this.name, this.email, this.address, this.phone, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    address = json["address"];
    phone = json["phone"];
    image = json["image"];
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => User.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["address"] = address;
    _data["phone"] = phone;
    _data["image"] = image;
    return _data;
  }
}
