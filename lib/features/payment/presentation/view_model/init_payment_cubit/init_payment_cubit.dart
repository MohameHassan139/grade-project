import 'dart:math';

import 'package:ar_shopping/features/payment/data/repo/payment_repos.dart';
import 'package:ar_shopping/features/payment/payment_constant.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/function/push_screen.dart';
import '../../../data/models/key_request_model/key_request_model.dart';
import '../../../data/models/kiosk/kiosk_model.dart';
import '../../../data/models/mobile_wallet/mobile_wallet.dart';
import '../../../data/models/order_request_model/order_request_model.dart';
import '../../../data/models/order_response_model/order_response_model.dart';

part 'init_payment_state.dart';

class InitPaymentCubit extends Cubit<InitPaymentState> {
  InitPaymentCubit({required this.paymentRepo}) : super(InitPaymentInitial());
  final PaymentRepo paymentRepo;

  bool isNavigate = false;

  Future<void> getAuthTokenPayment() async {
    emit(PaymentAuthtLoading());
    var token = await paymentRepo.authPayment();
    token.fold((token) async {
      emit(PaymentAuthSuccess(token: token));

      PaymentConstant.firstToken = token;
      print(PaymentConstant.firstToken);
    }, (error) {
      emit(PaymentAuthFailure(error: error.errorMessage));
    })?.then((value) async {
      await getOrder();
    });
  }

  // this line fore testing only and rmoved when ingrated with api
  final OrderRequestModel _orderRequestModel =
      OrderRequestModel.fromJson(orderData);
  Future<void> getOrder() async {
    _orderRequestModel.authToken = PaymentConstant.firstToken;
    emit(PaymentOrderLoading());
    var token = await paymentRepo.paymentRequestOrder(
        orderRequestModel: _orderRequestModel);
    token.fold((model) async {
      emit(PaymentOrderSuccess(orderResponseModel: model));
      PaymentConstant.orederId = model.id.toString();
    }, (error) {
      emit(PaymentOrderFailure(error: error.errorMessage));
    });
  }

// this line fore testing only and rmoved when ingrated with api
  final KeyRequestModel _keyRequestModel = KeyRequestModel.fromJson(keyData);

  Future<void> getFinalKey({required int intgrationId}) async {
    emit(PaymentKeyLoading());
    isNavigate = true;
    _keyRequestModel.orderId = PaymentConstant.orederId;
    _keyRequestModel.authToken = PaymentConstant.firstToken;
    _keyRequestModel.integrationId = intgrationId;

    var token =
        await paymentRepo.paymentRequestKey(keyRequestModel: _keyRequestModel);
    token.fold((payment_key) {
      emit(PaymentKeySuccess(payment_key: payment_key));
      PaymentConstant.finalToken = payment_key;
      print(payment_key);
    }, (error) {
      emit(PaymentkeyFailure(error: error.errorMessage));
    });
  }

  Future<void> getRefCode({required String finalToken}) async {
    emit(PaymentKioskLoading());

    var response =
        await paymentRepo.getRefCode(finalToken: PaymentConstant.finalToken);
    response.fold((kioskModel) {
      emit(PaymentKioskSuccess(kioskModel: kioskModel));
    }, (error) {
      emit(PaymentKioskFailure(error: error.errorMessage));
    });
  }

  Future<void> getMobileWallet({required String finalToken}) async {
    emit(PaymentMobileWalletLoading());

    var response = await paymentRepo.getMobileWallet(
        finalToken: PaymentConstant.finalToken);
    response.fold((mobileWallet) {
      emit(PaymentMobileWalletSuccess(mobileWallet: mobileWallet));
    }, (error) {
      emit(PaymentMobileWalletFailure(error: error.errorMessage));
    });
  }
}

Random random = Random();

/// testing only
Map<String, dynamic> orderData = {
  "auth_token": PaymentConstant.firstToken,
  "delivery_needed": "false",
  "amount_cents": "10",
  "currency": "EGP",
  "merchant_order_id": random.nextInt(9999999),
  "items": [
    {
      "name": "AS8r9iyge",
      "amount_cents": "5000",
      "description": "Smart Watch",
      "quantity": "1"
    },
    {
      "name": "ERT6",
      "amount_cents": "20000",
      "description": "Power ank",
      "quantity": "1"
    }
  ],
  "shipping_data": {
    "apartment": "80",
    "email": "mohamedhessan1@gmail.com",
    "floor": "42",
    "first_name": "Clifford",
    "street": "Ethan Land",
    "building": "80258",
    "phone_number": "+86(8)9135210487",
    "postal_code": "01898",
    "extra_description": "8 Ram , 128 Giga",
    "city": "Jaskolskiburgh",
    "country": "CR",
    "last_name": "Nicolas",
    "state": "Utah"
  },
  "shipping_details": {
    "notes": " test",
    "number_of_packages": 1,
    "weight": 1,
    "weight_unit": "Kilogram",
    "length": 1,
    "width": 1,
    "height": 1,
    "contents": "product of some sorts"
  }
};

Map<String, dynamic> keyData = {
  "auth_token": "ZXlKaGlPaUpJVXpVeE1pSX1Y0NJmV5Sn...",
  "amount_cents": "100",
  "expiration": 3600,
  "order_id": "103",
  "billing_data": {
    "apartment": "803",
    "email": "claudette09@exa.com",
    "floor": "42",
    "first_name": "Clifford",
    "street": "Ethan Land",
    "building": "8028",
    "phone_number": "+86(8)9135210487",
    "shipping_method": "PKG",
    "postal_code": "01898",
    "city": "Jaskolskiburgh",
    "country": "CR",
    "last_name": "Nicolas",
    "state": "Utah"
  },
  "currency": "EGP",
  "integration_id": 4544655,
  "lock_order_when_paid": "false"
};
