import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_body_bacground.dart';
import '../../../core/component/custom_botton.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/gadien_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHight * 0.05,
                    ),
                    CustomTextFormField(
                      labelText: "name",
                      fieldType: TextInputType.name,
                      prefixIcon: const Icon(
                        Icons.person_rounded,
                        color: CustomColors.kPinkColor,
                      ),
                    ),
                    SizedBox(
                      height: screenHight * 0.03,
                    ),
                    CustomTextFormField(
                      labelText: "phone",
                      fieldType: TextInputType.phone,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: CustomColors.kPinkColor,
                      ),
                    ),
                    SizedBox(
                      height: screenHight * 0.03,
                    ),
                    CustomTextFormField(
                      labelText: "email",
                      fieldType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: CustomColors.kPinkColor,
                      ),
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
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: CustomColors.kPinkColor,
                              ),
                              ispassword: showPassword,
                              suffix: IconButton(
                                icon: Visibility(
                                  replacement: const Icon(
                                    Icons.password,
                                    color: CustomColors.kPinkColor,
                                  ),
                                  visible: showPassword,
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                    color: CustomColors.kPinkColor,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              labelText: "confirm Password",
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: CustomColors.kPinkColor,
                              ),
                              ispassword: showPassword,
                              suffix: IconButton(
                                icon: Visibility(
                                  replacement: const Icon(
                                    Icons.password,
                                    color: CustomColors.kPinkColor,
                                  ),
                                  visible: showPassword,
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                    color: CustomColors.kPinkColor,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                              ),
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
                      fieldType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        color: CustomColors.kPinkColor,
                      ),
                    ),
                    SizedBox(
                      height: screenHight * 0.03,
                    ),
                    SizedBox(
                      height: screenHight * 0.04,
                    ),
                    CustomBottom(
                      screenHight: screenHight,
                      text: 'Register',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
