class ShippingDetails {
  String? notes;
  int? numberOfPackages;
  int? weight;
  String? weightUnit;
  int? length;
  int? width;
  int? height;
  String? contents;

  ShippingDetails(
      {this.notes,
      this.numberOfPackages,
      this.weight,
      this.weightUnit,
      this.length,
      this.width,
      this.height,
      this.contents});

  ShippingDetails.fromJson(Map<String, dynamic> json) {
    notes = json["notes"];
    numberOfPackages = json["number_of_packages"];
    weight = json["weight"];
    weightUnit = json["weight_unit"];
    length = json["length"];
    width = json["width"];
    height = json["height"];
    contents = json["contents"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["notes"] = notes;
    _data["number_of_packages"] = numberOfPackages;
    _data["weight"] = weight;
    _data["weight_unit"] = weightUnit;
    _data["length"] = length;
    _data["width"] = width;
    _data["height"] = height;
    _data["contents"] = contents;
    return _data;
  }
}
