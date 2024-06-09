import 'package:ar_shopping/features/home/data/models/product.dart';

class ProductUpdate {
  Product? products;

  ProductUpdate({this.products});

  ProductUpdate.fromJson(Map<String, dynamic> json) {
    products =
        json["products"] == null ? null : Product.fromJson(json["products"]);
  }

  static List<ProductUpdate> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ProductUpdate.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (products != null) {
      _data["products"] = products?.toJson();
    }
    return _data;
  }
}
