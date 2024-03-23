import 'dart:convert';

import 'package:ar_shopping/features/payment/data/models/key_request_model/billing_data.dart';

class KeyRequestModel {
  String? authToken;
  String? amountCents;
  int? expiration;
  String? orderId;
  BillingData? billingData;
  String? currency;
  int? integrationId;
  String? lockOrderWhenPaid;

  KeyRequestModel(
      {this.authToken,
      this.amountCents,
      this.expiration,
      this.orderId,
      this.billingData,
      this.currency,
      this.integrationId,
      this.lockOrderWhenPaid});

  KeyRequestModel.fromJson(Map<String, dynamic> json) {
    authToken = json["auth_token"];
    amountCents = json["amount_cents"];
    expiration = json["expiration"];
    orderId = json["order_id"];
    billingData = json["billing_data"] == null
        ? null
        : BillingData.fromJson(json["billing_data"]);
    currency = json["currency"];
    integrationId = json["integration_id"];
    lockOrderWhenPaid = json["lock_order_when_paid"];
  }

  String toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["auth_token"] = authToken;
    _data["amount_cents"] = amountCents;
    _data["expiration"] = expiration;
    _data["order_id"] = orderId;
    if (billingData != null) {
      _data["billing_data"] = billingData?.toJson();
    }
    _data["currency"] = currency;
    _data["integration_id"] = integrationId;
    _data["lock_order_when_paid"] = lockOrderWhenPaid;
    return jsonEncode(_data);
  }
}
