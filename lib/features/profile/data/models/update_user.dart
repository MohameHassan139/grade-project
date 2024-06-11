import 'dart:io';

import 'package:dio/dio.dart';

class UpdateUser {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  File? image;

  UpdateUser(
      {this.id, this.name, this.email, this.address, this.phone, this.image});

  UpdateUser.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    address = json["address"];
    phone = json["phone"];
    image = json["image"];
  }

  static List<UpdateUser> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UpdateUser.fromJson(map)).toList();
  }

  Future<FormData> formData() async {
    return FormData.fromMap({
      "file": await MultipartFile.fromFile(image?.path ?? '',
          filename: image?.path.split('/').last)
    });
  }

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["address"] = address;
    _data["phone"] = phone;
    _data["_method"] = "PUT";
    _data["image"] = await formData;
    return _data;
  }
}
