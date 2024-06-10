import '../../../auth/data/models/auth_model.dart';

class UpdateProfile {
  String? message;
  User? user;

  UpdateProfile({this.message, this.user});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  static List<UpdateProfile> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UpdateProfile.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}
