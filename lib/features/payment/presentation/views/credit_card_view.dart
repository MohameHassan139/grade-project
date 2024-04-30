import 'package:ar_shopping/features/payment/presentation/view_model/init_payment_cubit/init_payment_cubit.dart';
import 'package:ar_shopping/features/payment/presentation/views/widget/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
import '../../../../core/component/custom_appbar.dart';
import '../../../../core/component/custom_body_bacground.dart';
import '../../payment_constant.dart';

// #docregion platform_imports
// Import for Android features.
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// #enddocregion platform_imports
class CreditCardView extends StatelessWidget {
  const CreditCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(
        title: 'CreditCard pay',
      ),
      body: CustomBody(
          bodyHeight: height,
          bodyWidth: width,
          child: Container(
            height: MediaQuery.of(context).size.height *
                (MediaQuery.of(context).viewInsets.bottom != 0 ? .7 : 1),
            child: Center(
              child: BlocBuilder<InitPaymentCubit, InitPaymentState>(
                  builder: (context, state) {
                print(state);
                if (state is PaymentKeySuccess) {
                  return CustomWebView(
                    url:
                        'https://accept.paymobsolutions.com/api/acceptance/iframes/${PaymentConstant.Iframe}?payment_token=${PaymentConstant.finalToken}',
                  );
                } else if (state is PaymentkeyFailure) {
                  return Text(state.error);
                } else {
                  return const CircularProgressIndicator();
                }
              }),
            ),
          )),
    );
  }
}
