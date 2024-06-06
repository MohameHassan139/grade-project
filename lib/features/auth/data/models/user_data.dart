class UserData {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  dynamic address;
  dynamic phone;
  List<dynamic>? image;

  UserData({
    this.name,
    this.email,
    this.address,
    this.phone,
    this.image,
    this.password,
    this.confirmPassword,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    address = json["address"];
    phone = json["phone"];
    image = json["image"] ?? [];
  }

  static List<UserData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UserData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    _data["name"] = name;
    _data["email"] = email;
    _data["address"] = address;
    _data["phone"] = phone;
    _data["password"] = password;
    _data["password_confirmation"] = confirmPassword;
    if (image != null) {
      _data["image"] = image;
    }
    return _data;
  }
}
