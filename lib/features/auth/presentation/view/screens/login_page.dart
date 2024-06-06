import 'package:ar_shopping/features/auth/presentation/view/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../core/function/push_screen.dart';
import '../../../../bottom_navigator_bar/presentation/view/bottom_nav_bar.dart';
import '../../model_view/login_cubit/login_cubit.dart';
import '../widgets/custom_appbar.dart';
import '../../../../../core/component/custom_body_bacground.dart';
import '../../../../../core/component/custom_botton.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/gadien_text.dart';
import 'package:form_validator/form_validator.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColors.kBlackColor,
      appBar: CustomWaveAppBar(
        title: GradientText(
          text: "Login",
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
          bodyHeight: screenHight - screenHight * 0.22,
          bodyWidth: screenWidth,
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenHight * 0.07,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Welcome Come Back!',
                            style: GoogleFonts.acme(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.kGreyColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        CustomTextFormField(
                          fieldType: TextInputType.emailAddress,
                          textController: cubit.emailController,
                          labelText: "email",
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
                        CustomTextFormField(
                          fieldType: TextInputType.visiblePassword,
                          textController: cubit.passwordController,
                          labelText: "Password",
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
                              .minLength(
                                  6, 'Password must be at least 6 characters')
                              .build(),
                        ),
                        SizedBox(
                          height: screenHight * 0.04,
                        ),
                        CustomBottom(
                          screenHight: screenHight,
                          isloading: state is LoginLoading ? false : true,
                          text: 'Login',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              cubit
                                  .login(
                                      email: cubit.emailController.text,
                                      password: cubit.passwordController.text)
                                  .then((_) {
                                if (cubit.model!.token != null) {
                                  pushScreen(
                                      context: context,
                                      screen: BottomNavBarView());
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text(cubit.model?.message ?? 'null'),
                                  ));
                                }
                              });
                            }
                            if (state is LoginFailure) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(state.error),
                              ));
                            }
                          },
                        ),
                        SizedBox(
                          height: screenHight * 0.09,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: CustomColors.kGreyColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextButton(
                              onPressed: () {
                                pushScreen(
                                    context: context, screen: RegisterPage());
                              },
                              child: const Text("Register"),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
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
