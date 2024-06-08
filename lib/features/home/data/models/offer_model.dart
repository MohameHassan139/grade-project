import 'product.dart';

// class Offermodel {
//   List<Offers>? offers;

//   Offermodel({this.offers});

//   Offermodel.fromJson(Map<String, dynamic> json) {
//     offers = json["offers"] == null
//         ? null
//         : (json["offers"] as List).map((e) => Offers.fromJson(e)).toList();
//   }

//   static List<Offermodel> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Offermodel.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if (offers != null) {
//       _data["offers"] = offers?.map((e) => e.toJson()).toList();
//     }
//     return _data;
//   }
// }

// class Offers {
//   int? id;
//   String? name;
//   String? description;
//   String? price;
//   int? offer;
//   String? priceAfterOffer;
//   dynamic size;
//   List<Images>? images;
//   List<dynamic>? comments;

//   Offers(
//       {this.id,
//       this.name,
//       this.description,
//       this.price,
//       this.offer,
//       this.priceAfterOffer,
//       this.size,
//       this.images,
//       this.comments});

//   Offers.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     description = json["description"];
//     price = json["price"];
//     offer = json["offer"];
//     priceAfterOffer = json["price_after_offer"];
//     size = json["size"];
//     images = json["images"] == null
//         ? null
//         : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
//     comments = json["comments"] ?? [];
//   }

//   static List<Offers> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Offers.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["name"] = name;
//     _data["description"] = description;
//     _data["price"] = price;
//     _data["offer"] = offer;
//     _data["price_after_offer"] = priceAfterOffer;
//     _data["size"] = size;
//     if (images != null) {
//       _data["images"] = images?.map((e) => e.toJson()).toList();
//     }
//     if (comments != null) {
//       _data["comments"] = comments;
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


class Offermodel {
  List<Product>? offers;

  Offermodel({this.offers});

  Offermodel.fromJson(Map<String, dynamic> json) {
    offers = json["offers"] == null
        ? null
        : (json["offers"] as List).map((e) => Product.fromJson(e)).toList();
  }

  static List<Offermodel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Offermodel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (offers != null) {
      _data["offers"] = offers?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
