import 'package:ar_shopping/core/utils/styles.dart';
import 'package:ar_shopping/features/payment/data/repo/payment_repo_impl.dart';
import 'package:ar_shopping/features/payment/payment_constant.dart';
import 'package:ar_shopping/features/payment/presentation/view_model/init_payment_cubit/init_payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/component/custom_appbar.dart';
import '../../../../core/component/custom_body_bacground.dart';
import '../../../../core/function/push_screen.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/service_locator.dart';
// import '../../payment_services.dart';
import 'credit_card_view.dart';
import 'mobile_wallet_view.dart';
import 'ref_code_screen.dart';

class PaySelectView extends StatelessWidget {
  const PaySelectView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = BlocProvider.of<InitPaymentCubit>(context);
    cubit.getAuthTokenPayment();
    return Scaffold(
      appBar: CustomAppbar(
        title: 'pay',
      ),
      body: CustomBody(
        bodyHeight: height,
        bodyWidth: width,
        child: BlocBuilder<InitPaymentCubit, InitPaymentState>(
          builder: (context, state) {
            print(state);

            if (state is PaymentOrderSuccess || cubit.isNavigate) {
              return const PaymentSelectSuccess();
            } else if (state is PaymentOrderFailure) {
              return Center(child: Text(state.error));
            } else if (state is PaymentAuthFailure) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class PaymentSelectSuccess extends StatelessWidget {
  const PaymentSelectSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<InitPaymentCubit>(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                cubit.getFinalKey(
                    intgrationId: PaymentConstant.intgrationCardId);
                pushScreen(context: context, screen: CreditCardView())
                    .then((value) {});
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 66,
                    child: Image.asset(
                      AssetsData.creditCard,
                    ),
                  ),
                  Text(
                    'Credit Card',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                cubit.getFinalKey(
                    intgrationId: PaymentConstant.intgrationKioskdId);
                pushScreen(context: context, screen: ReferenceScreen())
                    .then((value) {});
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 66,
                    child: Image.asset(
                      AssetsData.fowry,
                    ),
                  ),
                  Text(
                    'Fowry',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                cubit.getFinalKey(
                    intgrationId: PaymentConstant.intgrationWalletId);
                pushScreen(context: context, screen: MobileWalletView())
                    .then((value) {});
                // CreditCardView
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 66,
                    child: Image.asset(
                      AssetsData.wallet,
                    ),
                  ),
                  Text(
                    'Phone Wallet',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
