class KioskModel {
  dynamic? id;
  bool? pending;
  dynamic? amountCents;
  bool? success;
  bool? isAuth;
  bool? isCapture;
  bool? isStandalonePayment;
  bool? isVoided;
  bool? isRefunded;
  bool? is3DSecure;
  dynamic? integrationId;
  dynamic? profileId;
  bool? hasParentTransaction;
  dynamic? order;
  String? createdAt;
  List<dynamic>? transactionProcessedCallbackResponses;
  String? currency;
  SourceData? sourceData;
  String? apiSource;
  bool? isVoid;
  bool? isRefund;
  Data? data;
  bool? isHidden;
  PaymentKeyClaims? paymentKeyClaims;
  bool? errorOccured;
  bool? isLive;
  String? otherEndpointReference;
  dynamic? refundedAmountCents;
  bool? isCaptured;
  dynamic? capturedAmount;
  String? merchantStaffTag;
  dynamic? owner;
  dynamic parentTransaction;

  KioskModel(
      {this.id,
      this.pending,
      this.amountCents,
      this.success,
      this.isAuth,
      this.isCapture,
      this.isStandalonePayment,
      this.isVoided,
      this.isRefunded,
      this.is3DSecure,
      this.integrationId,
      this.profileId,
      this.hasParentTransaction,
      this.order,
      this.createdAt,
      this.transactionProcessedCallbackResponses,
      this.currency,
      this.sourceData,
      this.apiSource,
      this.isVoid,
      this.isRefund,
      this.data,
      this.isHidden,
      this.paymentKeyClaims,
      this.errorOccured,
      this.isLive,
      this.otherEndpointReference,
      this.refundedAmountCents,
      this.isCaptured,
      this.capturedAmount,
      this.merchantStaffTag,
      this.owner,
      this.parentTransaction});

  KioskModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    pending = json["pending"];
    amountCents = json["amount_cents"];
    success = json["success"];
    isAuth = json["is_auth"];
    isCapture = json["is_capture"];
    isStandalonePayment = json["is_standalone_payment"];
    isVoided = json["is_voided"];
    isRefunded = json["is_refunded"];
    is3DSecure = json["is_3d_secure"];
    integrationId = json["integration_id"];
    profileId = json["profile_id"];
    hasParentTransaction = json["has_parent_transaction"];
    order = json["order"];
    createdAt = json["created_at"];
    transactionProcessedCallbackResponses =
        json["transaction_processed_callback_responses"] ?? [];
    currency = json["currency"];
    sourceData = json["source_data"] == null
        ? null
        : SourceData.fromJson(json["source_data"]);
    apiSource = json["api_source"];
    isVoid = json["is_void"];
    isRefund = json["is_refund"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    isHidden = json["is_hidden"];
    paymentKeyClaims = json["payment_key_claims"] == null
        ? null
        : PaymentKeyClaims.fromJson(json["payment_key_claims"]);
    errorOccured = json["error_occured"];
    isLive = json["is_live"];
    otherEndpointReference = json["other_endpoint_reference"];
    refundedAmountCents = json["refunded_amount_cents"];
    isCaptured = json["is_captured"];
    capturedAmount = json["captured_amount"];
    merchantStaffTag = json["merchant_staff_tag"];
    owner = json["owner"];
    parentTransaction = json["parent_transaction"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["pending"] = pending;
    _data["amount_cents"] = amountCents;
    _data["success"] = success;
    _data["is_auth"] = isAuth;
    _data["is_capture"] = isCapture;
    _data["is_standalone_payment"] = isStandalonePayment;
    _data["is_voided"] = isVoided;
    _data["is_refunded"] = isRefunded;
    _data["is_3d_secure"] = is3DSecure;
    _data["integration_id"] = integrationId;
    _data["profile_id"] = profileId;
    _data["has_parent_transaction"] = hasParentTransaction;
    _data["order"] = order;
    _data["created_at"] = createdAt;
    if (transactionProcessedCallbackResponses != null) {
      _data["transaction_processed_callback_responses"] =
          transactionProcessedCallbackResponses;
    }
    _data["currency"] = currency;
    if (sourceData != null) {
      _data["source_data"] = sourceData?.toJson();
    }
    _data["api_source"] = apiSource;
    _data["is_void"] = isVoid;
    _data["is_refund"] = isRefund;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["is_hidden"] = isHidden;
    if (paymentKeyClaims != null) {
      _data["payment_key_claims"] = paymentKeyClaims?.toJson();
    }
    _data["error_occured"] = errorOccured;
    _data["is_live"] = isLive;
    _data["other_endpoint_reference"] = otherEndpointReference;
    _data["refunded_amount_cents"] = refundedAmountCents;
    _data["is_captured"] = isCaptured;
    _data["captured_amount"] = capturedAmount;
    _data["merchant_staff_tag"] = merchantStaffTag;
    _data["owner"] = owner;
    _data["parent_transaction"] = parentTransaction;
    return _data;
  }
}

class PaymentKeyClaims {
  String? currency;
  int? amountCents;
  int? integrationId;
  int? order;
  int? userId;

  PaymentKeyClaims(
      {this.currency,
      this.amountCents,
      this.integrationId,
      this.order,
      this.userId});

  PaymentKeyClaims.fromJson(Map<String, dynamic> json) {
    currency = json["currency"];
    amountCents = json["amount_cents"];
    integrationId = json["integration_id"];
    order = json["order"];
    userId = json["user_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currency"] = currency;
    _data["amount_cents"] = amountCents;
    _data["integration_id"] = integrationId;
    _data["order"] = order;
    _data["user_id"] = userId;
    return _data;
  }
}

class Data {
  dynamic amount;
  int? gatewayIntegrationPk;
  String? aggTerminal;
  String? klass;
  String? rrn;
  int? dueAmount;
  String? ref;
  String? message;
  String? txnResponseCode;
  String? biller;
  int? billReference;
  dynamic fromUser;

  Data(
      {this.amount,
      this.gatewayIntegrationPk,
      this.aggTerminal,
      this.klass,
      this.rrn,
      this.dueAmount,
      this.ref,
      this.message,
      this.txnResponseCode,
      this.biller,
      this.billReference,
      this.fromUser});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json["amount"];
    gatewayIntegrationPk = json["gateway_integration_pk"];
    aggTerminal = json["agg_terminal"];
    klass = json["klass"];
    rrn = json["rrn"];
    dueAmount = json["due_amount"];
    ref = json["ref"];
    message = json["message"];
    txnResponseCode = json["txn_response_code"];
    biller = json["biller"];
    billReference = json["bill_reference"];
    fromUser = json["from_user"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["amount"] = amount;
    _data["gateway_integration_pk"] = gatewayIntegrationPk;
    _data["agg_terminal"] = aggTerminal;
    _data["klass"] = klass;
    _data["rrn"] = rrn;
    _data["due_amount"] = dueAmount;
    _data["ref"] = ref;
    _data["message"] = message;
    _data["txn_response_code"] = txnResponseCode;
    _data["biller"] = biller;
    _data["bill_reference"] = billReference;
    _data["from_user"] = fromUser;
    return _data;
  }
}

class SourceData {
  String? pan;
  String? type;
  String? subType;

  SourceData({this.pan, this.type, this.subType});

  SourceData.fromJson(Map<String, dynamic> json) {
    pan = json["pan"];
    type = json["type"];
    subType = json["sub_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["pan"] = pan;
    _data["type"] = type;
    _data["sub_type"] = subType;
    return _data;
  }
}
