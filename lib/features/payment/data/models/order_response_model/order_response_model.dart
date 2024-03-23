import 'dart:convert';

import 'merchant.dart';
import 'shipping_data.dart';

class OrderResponseModel {
  int? id;
  String? createdAt;
  bool? deliveryNeeded;
  Merchant? merchant;
  String? collector;
  int? amountCents;
  ShippingData? shippingData;
  String? currency;
  bool? isPaymentLocked;
  String? merchantOrderId;
  String? walletNotification;
  int? paidAmountCents;
  List<dynamic>? items;

  OrderResponseModel(
      {this.id,
      this.createdAt,
      this.deliveryNeeded,
      this.merchant,
      this.collector,
      this.amountCents,
      this.shippingData,
      this.currency,
      this.isPaymentLocked,
      this.merchantOrderId,
      this.walletNotification,
      this.paidAmountCents,
      this.items});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    deliveryNeeded = json["delivery_needed"];
    merchant =
        json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]);
    collector = json["collector"];
    amountCents = json["amount_cents"];
    shippingData = json["shipping_data"] == null
        ? null
        : ShippingData.fromJson(json["shipping_data"]);
    currency = json["currency"];
    isPaymentLocked = json["is_payment_locked"];
    merchantOrderId = json["merchant_order_id"];
    walletNotification = json["wallet_notification"];
    paidAmountCents = json["paid_amount_cents"];
    items = json["items"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["delivery_needed"] = deliveryNeeded;
    if (merchant != null) {
      _data["merchant"] = merchant?.toJson();
    }
    _data["collector"] = collector;
    _data["amount_cents"] = amountCents;
    if (shippingData != null) {
      _data["shipping_data"] = shippingData?.toJson();
    }
    _data["currency"] = currency;
    _data["is_payment_locked"] = isPaymentLocked;
    _data["merchant_order_id"] = merchantOrderId;
    _data["wallet_notification"] = walletNotification;
    _data["paid_amount_cents"] = paidAmountCents;
    if (items != null) {
      _data["items"] = items;
    }
    return _data;
  }
}
