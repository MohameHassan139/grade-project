class Items {
    String? name;
    String? amountCents;
    String? description;
    String? quantity;

    Items({this.name, this.amountCents, this.description, this.quantity});

    Items.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        amountCents = json["amount_cents"];
        description = json["description"];
        quantity = json["quantity"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["amount_cents"] = amountCents;
        _data["description"] = description;
        _data["quantity"] = quantity;
        return _data;
    }
}