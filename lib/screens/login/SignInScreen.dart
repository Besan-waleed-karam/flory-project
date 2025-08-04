import 'package:flory/navigationItems/navigation_menu.dart';
import 'package:flory/screens/login/registerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/validators/validation.dart';


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
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.textFieldsColor,
        borderRadius: BorderRadius.circular(11.r),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:  TextStyle(color: TColors.blackF, fontSize: 16.sp),
          prefixIcon: Icon(icon, color:  TColors.blackF),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          errorStyle:  TextStyle(
            color: TColors.error,
            fontSize: 12.sp,
            height: 1.5.h,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
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
                  SizedBox(height: 320.h),

                  Text(
                    TTexts.title2,
                    style:  TextStyle(
                      fontSize: 30.0.sp,
                      fontWeight: FontWeight.w300,
                      color: TColors.black,
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
                  SizedBox(height: 50.h),
                  //Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70.h,
                          width: 349.w,
                          child: _buildTextFormField(
                            controller: _emailController,
                            hintText: 'Email',
                            icon: Icons.email_outlined,
                            validator: TValidator.validateEmail,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          height: 70.h,
                          width: 349.w,
                          child: _buildTextFormField(
                            controller: _passwordController,
                            hintText: 'Password',
                            icon: Icons.lock_outline,
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
                        ),
                        SizedBox(height: 50.h),
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
                            SizedBox(width: 16.w),
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
                                  color: TColors.black,
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
                                  MaterialPageRoute(builder: (_)=>NavigationMenu())
                              );
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