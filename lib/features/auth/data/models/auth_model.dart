

class AuthModel {
  String? message;
  String? token = '';
  User? user;

  AuthModel({this.message, this.token, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    token = json["token"];
    user = json["User"] == null ? null : User.fromJson(json["User"]);
  }

  static List<AuthModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AuthModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["token"] = token;
    if (user != null) {
      _data["User"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic address;
  dynamic phone;
  dynamic image;

  User({this.id, this.name, this.email, this.address, this.phone, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    address = json["address"];
    phone = json["phone"];
    image = json["image"] ?? [];
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
    if (image != null) {
      _data["image"] = image;
    }
    return _data;
  }
}
