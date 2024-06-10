import '../../../auth/data/models/auth_model.dart';

class Profile {
  User? user;

  Profile({this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    user = json["User"] == null ? null : User.fromJson(json["User"]);
  }

  static List<Profile> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Profile.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["User"] = user?.toJson();
    }
    return _data;
  }
}
