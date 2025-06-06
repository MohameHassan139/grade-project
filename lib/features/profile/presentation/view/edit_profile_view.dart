import 'dart:io';

import 'package:ar_shopping/core/component/custom_network_image.dart';
import 'package:ar_shopping/features/profile/data/models/user_model.dart';
import 'package:ar_shopping/features/profile/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/component/custom_botton.dart';
import '../../../auth/presentation/view/widgets/custom_textformfield.dart';

class EditeProfile extends StatelessWidget {
  EditeProfile({Key? key, this.userData}) : super(key: key);
  User? userData;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var cubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return AnimationLimiter(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        delay: Duration(milliseconds: 100),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 150.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          SizedBox(height: 12),

                          // profile image
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: cubit.profileImage == null
                                      ? CustomNetworkImage(
                                          imageUrl:
                                              cubit.profileModel?.user?.image ??
                                                  '')
                                      : Image(
                                          image: FileImage(cubit.profileImage!)
                                              as ImageProvider),
                                ),
                              ),
                              CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                  onPressed: () {
                                    cubit.getProfileImage();
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHight * 0.05),
                          CustomTextFormField(
                            labelText: "name",
                            textController: cubit.nameController,
                            fieldType: TextInputType.name,
                            prefixIcon: const Icon(
                              Icons.person_rounded,
                              color: CustomColors.kPinkColor,
                            ),
                            validator: ValidationBuilder()
                                .minLength(
                                    3, 'Name must be at least 3 characters')
                                .build(),
                          ),
                          SizedBox(height: screenHight * 0.03),
                          CustomTextFormField(
                            labelText: "phone",
                            textController: cubit.phoneController,
                            fieldType: TextInputType.phone,
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: CustomColors.kPinkColor,
                            ),
                            validator: ValidationBuilder()
                                .phone('Enter a valid phone number')
                                .build(),
                          ),
                          SizedBox(height: screenHight * 0.03),
                          CustomTextFormField(
                            labelText: "email",
                            textController: cubit.emailController,
                            fieldType: TextInputType.emailAddress,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: CustomColors.kPinkColor,
                            ),
                            validator: ValidationBuilder()
                                .email('Enter a valid email address')
                                .build(),
                          ),
                          SizedBox(height: screenHight * 0.03),
                          CustomTextFormField(
                            labelText: "location",
                            textController: cubit.addressController,
                            fieldType: TextInputType.text,
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: CustomColors.kPinkColor,
                            ),
                            validator: ValidationBuilder()
                                .minLength(
                                    3, 'Location must be at least 3 characters')
                                .build(),
                          ),
                          SizedBox(height: screenHight * 0.03),
                          SizedBox(height: screenHight * 0.04),
                          CustomBottom(
                            screenHight: screenHight,
                            isloading: state is! UpdateProfileLoading,
                            text: 'Update',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.updateProfile().then((_) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        cubit.updateProfilemodel?.message ??
                                            'null'),
                                  ));
                                });
                              }
                              if (state is UpdateProfileFailure) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(state.error),
                                ));
                              }
                            },
                          ),
                          // Form(
                          //   key: _formKey,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [

                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
