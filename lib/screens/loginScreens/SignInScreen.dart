import 'package:flory/screens/loginScreens/password_configuration/forget_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/validators/validation.dart';
import '../../widgets/divider_social_login.dart';
import '../../widgets/login_text_fields.dart';
import '../../widgets/navigation_menu.dart';
import '../RegisterScreens/registerScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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

          //title , subtitle
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 290.h),
                  Text(
                    TTexts.title2,
                    style:  TextStyle(
                      fontSize: 30.0.sp,
                      fontWeight: FontWeight.w300,
                      color: dark ? TColors.white : TColors.black,
                      fontFamily: "LibreBaskerville",
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    TTexts.subTitle2,
                    style:  TextStyle(
                      fontSize: 14.0.sp,
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
                        ),
                        SizedBox(height: TSizes.spaceBtwInputFields.h),
                        LoginTextFields(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: CupertinoIcons.lock,
                          validator: TValidator.validatePassword,
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
                        SizedBox(height: TSizes.spaceBtwSections.h),
                        //confirm msg
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              TTexts.confirm_msg2,
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w500,
                                color: TColors.primary,
                                fontFamily: "LibreBaskerville",
                              ),
                            ),
                            SizedBox(width: TSizes.sm.w),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child:  Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                  color: dark ? TColors.white : TColors.black,
                                  fontFamily: "LibreBaskerville",
                                ),
                              ),
                            ),
                            SizedBox(width: TSizes.spaceBtwSections*2.w),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgetPassword(),
                                  ),
                                );
                              },
                              child:  Text(
                                TTexts.forgetyourpassword,
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                  color:TColors.primary,
                                  fontFamily: "LibreBaskerville",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        SizedBox(
                          height: 70.h,
                          width: 349.w,
                          child: ElevatedButton(
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              print("Valid");
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_)=>NavigationMenu()));

                              // }
                              //  else {
                              //  // check each field individually to identify where the problem is
                              //  String? emailError = TValidator.validateEmail(
                              //  _emailController.text,
                              //  );
                              //  String? passwordError =
                              //  TValidator.validatePassword(
                              //  _passwordController.text,
                              //  );
                              //  String firstErrorMessage =
                              //  emailError ??
                              //  passwordError ??
                              //  'Please check the form';
                              //  }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.buttonPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              elevation: 0,
                            ),
                            child:  Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: TColors.primaryBackground,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: TSizes.spaceBtwSections,),
                        DividerSocialLogin(divierText: 'Or Sign in With')

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}