class ProductsModel {
  List<Product>? products;
  ProductsModel({this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    products = json["products"] == null
        ? null
        : (json["products"] as List).map((e) => Product.fromJson(e)).toList();
  }

  static List<ProductsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ProductsModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  int? offer;
  String? priceAfterOffer;
  List<String>? size;
  List<Images>? images;
  List<dynamic>? comments;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.offer,
      this.priceAfterOffer,
      this.size,
      this.images,
      this.comments});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    offer = json["offer"];
    priceAfterOffer = json["price_after_offer"];
    // size = json["size"];
    size = ["Small", "Mediam", "lrage"];
    images = json["images"] == null
        ? null
        : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    comments = json["comments"] ?? [];
  }

  static List<Product> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Product.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["price"] = price;
    _data["offer"] = offer;
    _data["price_after_offer"] = priceAfterOffer;
    _data["size"] = size;
    if (images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    if (comments != null) {
      _data["comments"] = comments;
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

// class Product {
//   int? id;
//   String? name;
//   String? description;
//   String? price;
//   int? offer;
//   String? priceAfterOffer;
//   List<String>? size;
//   dynamic object;
//   List<Images>? images;
//   List<Comments>? comments;

//   Product(
//       {this.id,
//       this.name,
//       this.description,
//       this.price,
//       this.offer,
//       this.priceAfterOffer,
//       this.size,
//       this.object,
//       this.images,
//       this.comments});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     description = json["description"];
//     price = json["price"];
//     offer = json["offer"];
//     priceAfterOffer = json["price_after_offer"];
//     size = json["size"] == null ? null : List<String>.from(json["size"]);
//     object = json["object"];
//     images = json["images"] == null
//         ? null
//         : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
//     comments = json["comments"] == null
//         ? null
//         : (json["comments"] as List).map((e) => Comments.fromJson(e)).toList();
//   }

//   static List<Product> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Product.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["name"] = name;
//     _data["description"] = description;
//     _data["price"] = price;
//     _data["offer"] = offer;
//     _data["price_after_offer"] = priceAfterOffer;
//     if (size != null) {
//       _data["size"] = size;
//     }
//     _data["object"] = object;
//     if (images != null) {
//       _data["images"] = images?.map((e) => e.toJson()).toList();
//     }
//     if (comments != null) {
//       _data["comments"] = comments?.map((e) => e.toJson()).toList();
//     }
//     return _data;
//   }
// }

// class Comments {
//   String? comment;

//   Comments({this.comment});

//   Comments.fromJson(Map<String, dynamic> json) {
//     comment = json["comment"];
//   }

//   static List<Comments> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Comments.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["comment"] = comment;
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
