class ShippingData {
  int? id;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? state;
  String? country;
  String? email;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? shippingMethod;
  int? orderId;
  int? order;

  ShippingData(
      {this.id,
      this.firstName,
      this.lastName,
      this.street,
      this.building,
      this.floor,
      this.apartment,
      this.city,
      this.state,
      this.country,
      this.email,
      this.phoneNumber,
      this.postalCode,
      this.extraDescription,
      this.shippingMethod,
      this.orderId,
      this.order});

  ShippingData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    street = json["street"];
    building = json["building"];
    floor = json["floor"];
    apartment = json["apartment"];
    city = json["city"];
    state = json["state"];
    country = json["country"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    postalCode = json["postal_code"];
    extraDescription = json["extra_description"];
    shippingMethod = json["shipping_method"];
    orderId = json["order_id"];
    order = json["order"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["street"] = street;
    _data["building"] = building;
    _data["floor"] = floor;
    _data["apartment"] = apartment;
    _data["city"] = city;
    _data["state"] = state;
    _data["country"] = country;
    _data["email"] = email;
    _data["phone_number"] = phoneNumber;
    _data["postal_code"] = postalCode;
    _data["extra_description"] = extraDescription;
    _data["shipping_method"] = shippingMethod;
    _data["order_id"] = orderId;
    _data["order"] = order;
    return _data;
  }
}
