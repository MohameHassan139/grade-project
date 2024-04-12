import 'package:ar_shopping/features/payment/data/models/key_request_model/key_request_model.dart';
import 'package:ar_shopping/features/payment/data/models/kiosk/kiosk_model.dart';
import 'package:ar_shopping/features/payment/data/models/order_request_model/order_request_model.dart';
import 'package:ar_shopping/features/payment/data/models/order_response_model/order_response_model.dart';

import '../../core/api/api_service.dart';
import 'data/models/mobile_wallet/mobile_wallet.dart';

class PaymentService {
  Future<String> paymentAuth({
    required String api_key,
    required String quray,
  }) async {
    Future<Map<String, dynamic>> response =
        ApiService.api.post(quray: quray, data: {
      "api_key": api_key,
    });
    return response.then((value) => value["token"]);
  }

  Future<OrderResponseModel> paymentRequestOrder({
    required String api_key,
    required String quray,
    required OrderRequestModel orderRequestModel,
  }) async {
    var response = await ApiService.api
        .post(quray: quray, data: orderRequestModel.toJson());
    OrderResponseModel model = OrderResponseModel.fromJson(response);
    return model;
  }

  Future<String> paymentRequestKey(
      {required String api_key,
      required String quray,
      required KeyRequestModel keyRequestModel}) async {
    Future<Map<String, dynamic>> response =
        ApiService.api.post(quray: quray, data: keyRequestModel.toJson());
    return response.then((value) => value["token"]);
  }

  Future<KioskModel> getRefCode(
      {required String finalToken, required String quray}) async {
    Map<String, dynamic> response =
        await ApiService.api.post(quray: quray, data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": finalToken
    });
    print(response);
    KioskModel model = KioskModel.fromJson(response);
    return model;
  }

  Future<MobileWallet> getMobileWallet(
      {required String finalToken, required String quray}) async {
    Map<String, dynamic> response =
        await ApiService.api.post(quray: quray, data: {
      "source": {"identifier": "wallet mobile number", "subtype": "WALLET"},
      "payment_token": finalToken
    });
    print('$response @@@@@@@@');
    MobileWallet model = MobileWallet.fromJson(response);
    return model;
  }
}
