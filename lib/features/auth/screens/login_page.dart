import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_body_bacground.dart';
import '../../../core/component/custom_botton.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/gadien_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHight * 0.07,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcom Come Back !',
                        style: GoogleFonts.acme(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.kGreyColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomTextFormField(
                      labelText: "email",
                      prefixIcon: const Icon(
                        Icons.email,
                        color: CustomColors.kPinkColor,
                      ),
                    ),
                    SizedBox(
                      height: screenHight * 0.03,
                    ),
                    CustomTextFormField(
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
                    SizedBox(
                      height: screenHight * 0.04,
                    ),
                    CustomBottom(
                      screenHight: screenHight,
                      text: 'Login',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: screenHight * 0.09,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Do'n have an acount ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Register"),
                        ),
                      ],
                    ),
                    const Spacer(),
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
