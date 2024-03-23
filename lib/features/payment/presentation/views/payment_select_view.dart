import 'package:ar_shopping/features/payment/data/repo/payment_repo_impl.dart';
import 'package:ar_shopping/features/payment/presentation/view_model/init_payment_cubit/init_payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';
import '../../payment_services.dart';

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
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 66,
                          child: Image.asset(
                            AssetsData.creditCard,
                          ),
                        ),
                        Text('Credit Card')
                      ],
                    ),
                  )
                ],
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
