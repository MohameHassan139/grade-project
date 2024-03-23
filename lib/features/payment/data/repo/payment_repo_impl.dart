import 'package:ar_shopping/core/errors/failures.dart';
import 'package:ar_shopping/features/payment/data/models/key_request_model/key_request_model.dart';
import 'package:ar_shopping/features/payment/data/models/order_request_model/order_request_model.dart';
import 'package:ar_shopping/features/payment/data/models/order_response_model/order_response_model.dart';
import 'package:ar_shopping/features/payment/data/repo/payment_repos.dart';
import 'package:ar_shopping/features/payment/payment_constant.dart';
import 'package:ar_shopping/features/payment/payment_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PaymentRepoImpl implements PaymentRepo {
  PaymentRepoImpl({required this.paymentService});
  PaymentService paymentService;
  @override
  Future<Either<String, Failuer>> authPayment() async {
    try {
      String token = await paymentService.paymentAuth(
        quray: PaymentConstant.getAuthToken,
        api_key: PaymentConstant.apiKey,
      );

      return left(token);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<String, Failuer>> paymentRequestKey(
      {required KeyRequestModel keyRequestModel}) async {
    try {
      String paymentKey = await paymentService.paymentRequestKey(
        quray: PaymentConstant.getPaymentkey,
        api_key: PaymentConstant.apiKey,
        keyRequestModel: keyRequestModel,
      );

      return left(paymentKey);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<OrderResponseModel, Failuer>> paymentRequestOrder(
      {required OrderRequestModel orderRequestModel}) async {
    try {
      OrderResponseModel orderResponseModel =
          await paymentService.paymentRequestOrder(
        quray: PaymentConstant.getOrderId,
        api_key: PaymentConstant.apiKey,
        orderRequestModel: orderRequestModel,
      );

      return left(orderResponseModel);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }
}
