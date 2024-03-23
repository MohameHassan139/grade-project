import 'package:ar_shopping/core/errors/failures.dart';
import 'package:ar_shopping/features/payment/data/models/key_request_model/key_request_model.dart';
import 'package:ar_shopping/features/payment/data/models/order_request_model/order_request_model.dart';
import 'package:ar_shopping/features/payment/data/models/order_response_model/order_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentRepo {
  Future<Either<String, Failuer>> authPayment();
  Future<Either<OrderResponseModel, Failuer>> paymentRequestOrder({
    required OrderRequestModel orderRequestModel,
  });
  Future<Either<String, Failuer>> paymentRequestKey(
      {required KeyRequestModel keyRequestModel});
}
