import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../core/function/push_screen.dart';
import '../../../../bottom_navigator_bar/presentation/view/bottom_nav_bar.dart';
import '../../../../home/presentation/views/screens/home.dart';
import '../../model_view/register_cubit/register_cubit.dart';
import '../widgets/custom_appbar.dart';
import '../../../../../core/component/custom_body_bacground.dart';
import '../../../../../core/component/custom_botton.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/gadien_text.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var cubit = BlocProvider.of<RegisterCubit>(context);

    return Scaffold(
      backgroundColor: CustomColors.kBlackColor,
      appBar: CustomWaveAppBar(
        title: GradientText(
          text: "Register",
          style: GoogleFonts.acme(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 56, 51, 161),
              Colors.black,
            ],
          ),
        ),
        barHeight: screenHight * 0.20,
      ),
      body: SingleChildScrollView(
        child: CustomBody(
          bodyHeight: screenHight - screenHight * 0.28,
          bodyWidth: screenWidth,
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: AnimationLimiter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                         
                          children: [
                            SizedBox(
                              height: screenHight * 0.05,
                            ),
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
                            SizedBox(
                              height: screenHight * 0.03,
                            ),
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
                            SizedBox(
                              height: screenHight * 0.03,
                            ),
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
                            SizedBox(
                              height: screenHight * 0.03,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      labelText: "Password",
                                      textController: cubit.passwordController,
                                      prefixIcon: const Icon(
                                        Icons.lock_outline,
                                        color: CustomColors.kPinkColor,
                                      ),
                                      ispassword: cubit.showPassword,
                                      suffix: IconButton(
                                        icon: Visibility(
                                          replacement: const Icon(
                                            Icons.password,
                                            color: CustomColors.kPinkColor,
                                          ),
                                          visible: cubit.showPassword,
                                          child: const Icon(
                                            Icons.remove_red_eye,
                                            color: CustomColors.kPinkColor,
                                          ),
                                        ),
                                        onPressed: cubit.isShown,
                                      ),
                                      validator: ValidationBuilder()
                                          .minLength(6,
                                              'Password must be at least 6 characters')
                                          .build(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: CustomTextFormField(
                                      textController:
                                          cubit.comfirmPasswordController,
                                      labelText: "confirm Password",
                                      prefixIcon: const Icon(
                                        Icons.lock_outline,
                                        color: CustomColors.kPinkColor,
                                      ),
                                      ispassword: cubit.showPassword,
                                      suffix: IconButton(
                                        icon: Visibility(
                                          replacement: const Icon(
                                            Icons.password,
                                            color: CustomColors.kPinkColor,
                                          ),
                                          visible: cubit.showPassword,
                                          child: const Icon(
                                            Icons.remove_red_eye,
                                            color: CustomColors.kPinkColor,
                                          ),
                                        ),
                                        onPressed: cubit.isShown,
                                      ),
                                      validator: (value) {
                                        if (value !=
                                            cubit.passwordController.text) {
                                          return 'Passwords do not match';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHight * 0.03,
                            ),
                            CustomTextFormField(
                              labelText: "location",
                              textController: cubit.addressController,
                              fieldType: TextInputType.text,
                              prefixIcon: const Icon(
                                Icons.location_on_outlined,
                                color: CustomColors.kPinkColor,
                              ),
                              validator: ValidationBuilder()
                                  .minLength(3,
                                      'Location must be at least 3 characters')
                                  .build(),
                            ),
                            SizedBox(
                              height: screenHight * 0.03,
                            ),
                            SizedBox(
                              height: screenHight * 0.04,
                            ),
                            CustomBottom(
                              screenHight: screenHight,
                              isloading:
                                  state is RegisterLoading ? false : true,
                              text: 'Register',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.register().then((_) {
                                    if (cubit.model!.token != null) {
                                      pushAndRemoveUntil(
                                        context: context,
                                        screen: BottomNavBarView(),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            cubit.model?.message ?? 'null'),
                                      ));
                                    }
                                  });
                                }
                                if (state is RegisterFailure) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(state.error),
                                  ));
                                }
                              },
                            ),
                          ],
                     
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
