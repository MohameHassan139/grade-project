class PaymentConstant {
  static const String apiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RBd016YzVMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuZFdjU1diWTlZRl94a3VweWhoVjQyQ0hXazhGVWZBRXZDX2lLcTBVWG9NcUNFNl9qSG1pRTdPYXRyc2dXaFdWM21BSWZRbkhjQU9CRVhqTnJiVElJbVE=';
  static const String baseURL = 'https://accept.paymob.com/api/';
  static const String getAuthToken = '${baseURL}auth/tokens';
  static const String getOrderId = '${baseURL}ecommerce/orders';
  static const String getPaymentkey = '${baseURL}acceptance/payment_keys';
  static const String getRefCode = '${baseURL}acceptance/payments/pay';
  static const int intgrationCardId = 4205636;
  static const int intgrationWalletId = 4544655;
  static const int intgrationKioskdId = 4207013;
  static const int Iframe = 787696;
  static String finalToken = '';
  static String refCode = '';
  static String firstToken = '';
  static String orederId = '';
}
// 787696