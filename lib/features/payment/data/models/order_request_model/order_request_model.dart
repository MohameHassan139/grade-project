import 'dart:convert';

import 'item.dart';
import 'shipping_data.dart';
import 'shipping_details.dart';

class OrderRequestModel {
  late String authToken;
  late String deliveryNeeded;
  late String amountCents;
  late String currency;
  int? merchantOrderId;
  late List<Items> items;
  ShippingData? shippingData;
  ShippingDetails? shippingDetails;

  OrderRequestModel(
      {required this.authToken,
      required this.deliveryNeeded,
      required this.amountCents,
      required this.currency,
      this.merchantOrderId,
      required this.items,
      this.shippingData,
      this.shippingDetails});

  OrderRequestModel.fromJson(Map<String, dynamic> json) {
    authToken = json["auth_token"];
    deliveryNeeded = json["delivery_needed"];
    amountCents = json["amount_cents"];
    currency = json["currency"];
    merchantOrderId = json["merchant_order_id"];
    items = (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    shippingData = json["shipping_data"] == null
        ? null
        : ShippingData.fromJson(json["shipping_data"]);
    shippingDetails = json["shipping_details"] == null
        ? null
        : ShippingDetails.fromJson(json["shipping_details"]);
  }

  String toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["auth_token"] = authToken;
    _data["delivery_needed"] = deliveryNeeded;
    _data["amount_cents"] = amountCents;
    _data["currency"] = currency;
    _data["merchant_order_id"] = merchantOrderId;
    if (items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    if (shippingData != null) {
      _data["shipping_data"] = shippingData?.toJson();
    }
    if (shippingDetails != null) {
      _data["shipping_details"] = shippingDetails?.toJson();
    }
    return jsonEncode(_data);
  }
}
