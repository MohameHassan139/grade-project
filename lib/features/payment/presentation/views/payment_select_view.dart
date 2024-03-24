import 'package:ar_shopping/core/utils/styles.dart';
import 'package:ar_shopping/features/payment/data/repo/payment_repo_impl.dart';
import 'package:ar_shopping/features/payment/payment_constant.dart';
import 'package:ar_shopping/features/payment/presentation/view_model/init_payment_cubit/init_payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/function/push_screen.dart';
import '../../../../core/utils/assets.dart';
import '../../payment_services.dart';
import 'credit_card_view.dart';

class PaySelectView extends StatelessWidget {
  const PaySelectView({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = BlocProvider.of<InitPaymentCubit>(context);

    return BlocProvider<InitPaymentCubit>(
      create: (context) => InitPaymentCubit(
          paymentRepo: PaymentRepoImpl(paymentService: PaymentService())),
      // ..getAuthTokenPayment(),
      child: Scaffold(
        body: BlocBuilder<InitPaymentCubit, InitPaymentState>(
          builder: (context, state) {
            print(state);

            // if (state is PaymentKeySuccess)
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<InitPaymentCubit>(context)
                            .getFinalKey(
                                intgrationId: PaymentConstant.intgrationCardId)
                            .then((value) {
                          if (state is PaymentKeySuccess) {
                            pushScreen(
                                context: context,
                                screen: CreditCardView(
                                  finalToken: state.payment_key,
                                ));
                          }
                        });
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
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
            // else
            // return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
