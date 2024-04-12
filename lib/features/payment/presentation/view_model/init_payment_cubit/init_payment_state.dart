part of 'init_payment_cubit.dart';

@immutable
sealed class InitPaymentState {}

final class InitPaymentInitial extends InitPaymentState {}

final class PaymentAuthtLoading extends InitPaymentState {}

final class PaymentAuthFailure extends InitPaymentState {
  final String error;
  PaymentAuthFailure({required this.error});
}

final class PaymentAuthSuccess extends InitPaymentState {
  final String token;
  PaymentAuthSuccess({required this.token});
}

final class PaymentOrderLoading extends InitPaymentState {}

final class PaymentOrderFailure extends InitPaymentState {
  final String error;
  PaymentOrderFailure({required this.error});
}

final class PaymentOrderSuccess extends InitPaymentState {
  final OrderResponseModel orderResponseModel;
  PaymentOrderSuccess({required this.orderResponseModel});
}

final class PaymentKeyLoading extends InitPaymentState {}

final class PaymentkeyFailure extends InitPaymentState {
  final String error;
  PaymentkeyFailure({required this.error});
}

final class PaymentKeySuccess extends InitPaymentState {
  final String payment_key;
  PaymentKeySuccess({
    required this.payment_key,
  });
}

final class PaymentKioskLoading extends InitPaymentState {}

final class PaymentKioskFailure extends InitPaymentState {
  final String error;
  PaymentKioskFailure({required this.error});
}

final class PaymentKioskSuccess extends InitPaymentState {
  final KioskModel kioskModel;
  PaymentKioskSuccess({
    required this.kioskModel,
  });
}


final class PaymentMobileWalletLoading extends InitPaymentState {}

final class PaymentMobileWalletFailure extends InitPaymentState {
  final String error;
  PaymentMobileWalletFailure({required this.error});
}

final class PaymentMobileWalletSuccess extends InitPaymentState {
  final MobileWallet mobileWallet;
  PaymentMobileWalletSuccess({
    required this.mobileWallet,
  });
}
