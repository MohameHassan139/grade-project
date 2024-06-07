class Category {
  String? title;
  List<String>? selections;

  Category({required this.title, required this.selections});

  Category.fromJson(Map<String, dynamic> data) {
    title = data['title'] ?? '';
    selections = data['selections'] ?? [''];
  }
}

// class CategoryModel {
//   List<Categories>? categories;

//   CategoryModel({this.categories});

//   CategoryModel.fromJson(Map<String, dynamic> json) {
//     categories = json["Categories"] == null
//         ? null
//         : (json["Categories"] as List)
//             .map((e) => Categories.fromJson(e))
//             .toList();
//   }

//   static List<CategoryModel> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => CategoryModel.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if (categories != null) {
//       _data["Categories"] = categories?.map((e) => e.toJson()).toList();
//     }
//     return _data;
//   }
// }

// class Categories {
//   int? id;
//   String? name;
//   List<Images>? images;

//   Categories({this.id, this.name, this.images});

//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     images = json["images"] == null
//         ? null
//         : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
//   }

//   static List<Categories> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Categories.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["name"] = name;
//     if (images != null) {
//       _data["images"] = images?.map((e) => e.toJson()).toList();
//     }
//     return _data;
//   }
// }

// class Images {
//   String? url;

//   Images({this.url});

//   Images.fromJson(Map<String, dynamic> json) {
//     url = json["url"];
//   }

//   static List<Images> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Images.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["url"] = url;
//     return _data;
//   }
// }

class CategoryModel {
  List<Categories>? subCategories;

  CategoryModel({this.subCategories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    subCategories = json["subCategories"] == null
        ? null
        : (json["subCategories"] as List)
            .map((e) => Categories.fromJson(e))
            .toList();
  }

  static List<CategoryModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CategoryModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (subCategories != null) {
      _data["subCategories"] = subCategories?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Categories {
  int? id;
  String? name;
  String? description;
  List<Images>? images;

  Categories({this.id, this.name, this.description, this.images});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    images = json["images"] == null
        ? null
        : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
  }

  static List<Categories> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Categories.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    if (images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Images {
  String? url;

  Images({this.url});

  Images.fromJson(Map<String, dynamic> json) {
    url = json["url"];
  }

  static List<Images> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Images.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    return _data;
  }
}
