import 'package:flory/screens/RegisterScreens/verify_email.dart';
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/validators/validation.dart';
import '../../widgets/divider_social_login.dart';
import '../../widgets/login_text_fields.dart';
import '../loginScreens/SignInScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumController = TextEditingController();

  bool _isPasswordHidden = true;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? TColors.blackF : TColors.primaryBackground,
      body: Stack(
        children: [
          //Image
          Positioned(
            top: 0.h,
            left: 0.w,
            child: Image.asset(TImages.flower, width: 267.w, height: 337.h),
          ),
          // title , subtitle
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 290.h),

                  Text(
                    TTexts.title1,
                    style: TextStyle(
                      fontSize: 30.0.sp,
                      fontWeight: FontWeight.w300,
                      color: dark ? TColors.white : TColors.black,
                      fontFamily: "LibreBaskerville",
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    TTexts.subTitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: TColors.primary,
                      fontFamily: "LibreBaskerville",
                    ),
                  ),

                  SizedBox(height: TSizes.spaceBtwSections.h),
                  //Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        LoginTextFields(
                          controller: _emailController,
                          hintText: 'Email',
                          icon: CupertinoIcons.mail,
                          validator: TValidator.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: TSizes.spaceBtwInputFields.h),
                        LoginTextFields(
                          controller: _phoneNumController,
                          hintText: 'Phone number',
                          icon: CupertinoIcons.phone,
                          validator: TValidator.validatePhoneNumber,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: TSizes.spaceBtwInputFields.h),
                        LoginTextFields(
                          controller: _usernameController,
                          hintText: 'Username',
                          icon: CupertinoIcons.person,
                          validator: TValidator.validateUsername,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: TSizes.spaceBtwInputFields.h),
                        LoginTextFields(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: CupertinoIcons.lock,
                          //validator: _validatePassword,
                          validator: TValidator.validatePassword,
                          keyboardType: TextInputType.visiblePassword,

                          obscureText: _isPasswordHidden,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF666666),
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordHidden = !_isPasswordHidden;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: TSizes.spaceBtwInputFields.h),
                        //confirm msg
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              TTexts.confirm_msg,
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w500,
                                color: TColors.primary,
                                fontFamily: "LibreBaskerville",
                              ),
                            ),
                            SizedBox(width: 16.w),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                  color: dark ? TColors.white : TColors.black,
                                  fontFamily: "LibreBaskerville",
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Register Btn
                        SizedBox(height: TSizes.spaceBtwItems.h),
                        SizedBox(
                          height: 70.h,
                          width: 349.w,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(VerifyEmail());
                              } else {
                                // check each field individually to identify where the problem is
                                String? emailError = TValidator.validateEmail(
                                  _emailController.text,
                                );
                                String? usernameError =
                                TValidator.validateUsername(
                                  _usernameController.text,
                                );
                                String? passwordError =
                                TValidator.validatePassword(
                                  _passwordController.text,
                                );

                                String firstErrorMessage =
                                    emailError ??
                                        usernameError ??
                                        passwordError ??
                                        'Please check the form';
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.buttonPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: TColors.primaryBackground,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  DividerSocialLogin(divierText: 'Or Sign up with'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}