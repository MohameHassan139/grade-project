import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/core/component/custom_botton.dart';
import 'package:ar_shopping/features/auth/presentation/view/widgets/custom_textformfield.dart';
import 'package:ar_shopping/features/product_details/presentation/model_view/add_review_cubit/add_review_cubit.dart';
import 'package:ar_shopping/features/product_details/presentation/model_view/rate_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:rate/rate.dart';

// class CustomButtomSheet extends StatelessWidget {
//   CustomButtomSheet({
//     super.key,
//     required this.id,
//   });
//   int id;
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     var cubit = BlocProvider.of<AddReviewCubit>(context);
//     var screenHight = MediaQuery.of(context).size.height;
//     return BlocBuilder<AddReviewCubit, AddReviewState>(
//       builder: (context, state) {
//         if (!cubit.bottomSheetClosed) {
//           return Container(
//             height: 300,
//             width: double.infinity,
//             color: CustomColors.kBlackColor,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(
//                       height: 110,
//                       child: CustomTextFormField(
//                         minLines: 4,
//                         labelText: "add review",
//                         textController: cubit.addReviewController,
//                         validator: ValidationBuilder()
//                             .minLength(
//                                 3, 'comment must be at least 3 characters')
//                             .build(),
//                       ),
//                       // child: TextFormField(),
//                     ),

//                     Rate(
//                       iconSize: 40,
//                       color: Colors.amber,
//                       allowHalf: true,
//                       allowClear: true,
//                       initialValue: 0,
//                       readOnly: false,
//                       onChange: (value) {
//                         cubit.rate = value;
//                       },
//                     ),
//                     CustomBottom(
//                       isloading: state is! onSubmitLoading,
//                       text: "add",
//                       screenHight: screenHight,
//                       onTap: () {
//                         if (_formKey.currentState!.validate()) {
//                           cubit.onSubmit(id: id, context: context);
//                         }
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }
// }
class CustomButtomSheet extends StatefulWidget {
  final int id;

  CustomButtomSheet({
    super.key,
    required this.id,
  });

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomButtomSheet> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AddReviewCubit>(context);
    var screenHight = MediaQuery.of(context).size.height;

    return BlocBuilder<AddReviewCubit, AddReviewState>(
      bloc: cubit,
      // buildWhen: (previous, current) => current is ,
      builder: (context, state) {
        if (!cubit.bottomSheetClosed) {
          return Container(
            height: 300,
            width: double.infinity,
            color: CustomColors.kBlackColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 110,
                      child: CustomTextFormField(
                        minLines: 4,
                        labelText: "add review",
                        textController: cubit.addReviewController,
                        validator: ValidationBuilder()
                            .minLength(
                                3, 'comment must be at least 3 characters')
                            .build(),
                      ),
                    ),
                    Rate(
                      iconSize: 40,
                      color: Colors.amber,
                      allowHalf: true,
                      allowClear: true,
                      initialValue: 0,
                      readOnly: false,
                      onChange: (value) {
                        cubit.rate = value;
                      },
                    ),
                    CustomBottom(
                      isloading: cubit.isloading,
                      text: "add review",
                      screenHight: screenHight,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          cubit
                              .onSubmit(id: widget.id, context: context)
                              .then((_) {
                            cubit.closeBottomSheet();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
