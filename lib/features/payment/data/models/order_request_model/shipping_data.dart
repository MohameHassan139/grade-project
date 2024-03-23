class ShippingData {
    String? apartment;
    String? email;
    String? floor;
    String? firstName;
    String? street;
    String? building;
    String? phoneNumber;
    String? postalCode;
    String? extraDescription;
    String? city;
    String? country;
    String? lastName;
    String? state;

    ShippingData({this.apartment, this.email, this.floor, this.firstName, this.street, this.building, this.phoneNumber, this.postalCode, this.extraDescription, this.city, this.country, this.lastName, this.state});

    ShippingData.fromJson(Map<String, dynamic> json) {
        apartment = json["apartment"];
        email = json["email"];
        floor = json["floor"];
        firstName = json["first_name"];
        street = json["street"];
        building = json["building"];
        phoneNumber = json["phone_number"];
        postalCode = json["postal_code"];
        extraDescription = json["extra_description"];
        city = json["city"];
        country = json["country"];
        lastName = json["last_name"];
        state = json["state"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["apartment"] = apartment;
        _data["email"] = email;
        _data["floor"] = floor;
        _data["first_name"] = firstName;
        _data["street"] = street;
        _data["building"] = building;
        _data["phone_number"] = phoneNumber;
        _data["postal_code"] = postalCode;
        _data["extra_description"] = extraDescription;
        _data["city"] = city;
        _data["country"] = country;
        _data["last_name"] = lastName;
        _data["state"] = state;
        return _data;
    }
}