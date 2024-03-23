class Merchant {
  int? id;
  String? createdAt;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;

  Merchant(
      {this.id,
      this.createdAt,
      this.phones,
      this.companyEmails,
      this.companyName,
      this.state,
      this.country,
      this.city,
      this.postalCode,
      this.street});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    phones = json["phones"] == null ? null : List<String>.from(json["phones"]);
    companyEmails = json["company_emails"] == null
        ? null
        : List<String>.from(json["company_emails"]);
    companyName = json["company_name"];
    state = json["state"];
    country = json["country"];
    city = json["city"];
    postalCode = json["postal_code"];
    street = json["street"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    if (phones != null) {
      _data["phones"] = phones;
    }
    if (companyEmails != null) {
      _data["company_emails"] = companyEmails;
    }
    _data["company_name"] = companyName;
    _data["state"] = state;
    _data["country"] = country;
    _data["city"] = city;
    _data["postal_code"] = postalCode;
    _data["street"] = street;
    return _data;
  }
}
