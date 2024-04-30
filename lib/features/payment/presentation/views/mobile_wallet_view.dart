
import 'package:ar_shopping/features/payment/presentation/view_model/init_payment_cubit/init_payment_cubit.dart';
import 'package:ar_shopping/features/payment/presentation/views/widget/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/component/custom_appbar.dart';
import '../../../../core/component/custom_body_bacground.dart';


class MobileWalletView extends StatelessWidget {
  const MobileWalletView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<InitPaymentCubit>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Mobile Wallet pay',
      ),
      body: CustomBody(
          bodyHeight: height,
          bodyWidth: width,
          child: Center(
            child: BlocConsumer<InitPaymentCubit, InitPaymentState>(
                listener: (context, state) {
              if (state is PaymentKeySuccess) {
                cubit.getMobileWallet(finalToken: state.payment_key);
              }
              if (state is PaymentMobileWalletSuccess) {
                print('@@@@@@@@@@@state.mobileWallet.redirectUrl');

                print(state.mobileWallet.redirectUrl);
              }
            }, builder: (context, state) {
              print(state);

              if (state is PaymentMobileWalletSuccess) {
                return CustomWebView(
                  url: state.mobileWallet.iframeRedirectionUrl,
                );
              } else if (state is PaymentkeyFailure) {
                return Text(state.error);
              } else if (state is PaymentMobileWalletFailure) {
                return Text(state.error);
              } else {
                return const CircularProgressIndicator();
              }
            }),
          )),
    );
  }
}
