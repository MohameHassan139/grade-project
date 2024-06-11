import 'package:ar_shopping/core/function/push_screen.dart';
import 'package:ar_shopping/features/auth/presentation/view/screens/login_page.dart';
import 'package:ar_shopping/features/profile/presentation/view/edit_profile_view.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/core/component/custom_body_bacground.dart';
import 'package:ar_shopping/core/component/custom_network_image.dart';
import 'package:ar_shopping/core/component/error_widget.dart';
import 'package:ar_shopping/features/profile/data/models/profile_model.dart';
import 'package:ar_shopping/features/profile/presentation/model_view/cubit/profile_cubit.dart';
import 'package:ar_shopping/features/profile/presentation/view/widget/build_profile_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'widget/data_field.dart';
import 'widget/shimmer_loading.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      body: CustomBody(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is GetProfileFailure) {
                      return CustomErrorWidget(errorMessage: state.error);
                    } else if (state is GetProfileLoading) {
                      return const ProfileShimmerLoading();
                    }
                    return BuildProfileContent(
                      model: cubit.profileModel!,
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      pushScreen(
                          context: context,
                          screen: EditeProfile(
                              // userData: cubit.profileModel.user,
                              ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.kGreenColor,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: CustomColors.kWhiteColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Edite",
                          style: TextStyle(
                            color: CustomColors.kWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.question,
                        animType: AnimType.rightSlide,
                        title: 'Logout ',
                        desc: 'Are you sure you want to log out ',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          cubit.logout().then((_) {
                            pushAndRemoveUntil(
                                context: context, screen: LoginPage());
                          });
                        },
                      ).show();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: CustomColors.kWhiteColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: CustomColors.kWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'Delete Account',
                        desc: 'Are you sure you want delete this account',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          cubit.deleteAccount().then((_) {
                            pushAndRemoveUntil(
                                context: context, screen: LoginPage());
                          });
                        },
                      ).show();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_outline_sharp,
                          color: CustomColors.kWhiteColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Delete Account",
                          style: TextStyle(
                            color: CustomColors.kWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
