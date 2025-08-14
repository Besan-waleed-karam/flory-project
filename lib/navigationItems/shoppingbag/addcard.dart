import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/appbar_theme.dart';
import '../../utils/theme/custom_themes/text_theme.dart';

class Addcard extends StatefulWidget {
  const Addcard({super.key});

  @override
  State<Addcard> createState() => _AddcardState();
}

class _AddcardState extends State<Addcard> {
  bool save = false;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: dark ? TAppbarTheme.darkAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: []) :TAppbarTheme.lightAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: []) ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Add Card",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: dark ?TColors.white:TColors.black)),),
              SizedBox(height: 15.h),
              Text(
                "We'll ship it to your address below",
                style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 35.h,),
              Card(
                elevation:4,
                shadowColor: TColors.primary,
                child: Container(
                  width: 342.w,
                  height: 440.h,
                  // margin: const EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                     children: [
                       SizedBox(width: 15.w,),
                       Icon(Iconsax.card,size: 32.r,color: TColors.primary,),
                       SizedBox(width: 12.w,),
                       Text("Credit / Depit Card",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: Colors.black),)
                     ],
                     ),
                      SizedBox(height: 12.h,),
                      Container(width: 300.w,height: 1.h,color: TColors.primary40,),
                      SizedBox(height: 30.h,),
                      Container(
                        width: 295.w,
                        height: 340.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cardholder Name",style: TextStyle(fontFamily: "Inter",fontSize: 14.sp,color: Colors.black),),
                            SizedBox(height: 5.h),
                            SizedBox(
                              width: 295.w,
                              height: 32.h,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20.sp),
                                decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6.r),
                                        borderSide: BorderSide(color: TColors.primary40, width: 1.5.w), // Normal state border color
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6.r),
                                        borderSide: BorderSide(color: TColors.primary, width: 2.w), // On focus border color
                                      ),
        
                                    contentPadding: EdgeInsets.only(left: 15.w),
                                    hintText: "Baraa Alaydi",
                                    hintStyle: TextStyle(fontFamily: "Inter",fontSize: 14.sp,color: TColors.primary40),
                                    filled: true,
                                    fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white
        
                                ),),
                            ),
        
                            SizedBox(height: 23.h,),
                            Text("Card Number",style: TextStyle(fontFamily: "Inter",fontSize: 14.sp,color: Colors.black),),
                            SizedBox(height: 5.h),
                            SizedBox(
                              width: 295.w,
                              height: 32.h,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20.sp),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.r),
                                      borderSide: BorderSide(color: TColors.primary40, width: 1.5.w), // Normal state border color
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.r),
                                      borderSide: BorderSide(color: TColors.primary, width: 2.w), // On focus border color
                                    ),
                                    contentPadding: EdgeInsets.only(left: 15.w),
                                    hintText: "1234 5678 9101 22592",
                                    hintStyle: TextStyle(fontFamily: "Inter",fontSize: 14.sp,color: TColors.primary40),
                                    filled: true,
                                    fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white
        
                                ),),
                            ),
                            SizedBox(height: 23.h,),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Expiration Date",style: TextStyle(fontFamily: "Inter",fontSize: 14.sp,color: Colors.black),),
                                    SizedBox(height: 5.h),
                                    SizedBox(
                                      width: 129,
                                      height: 32,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 20.sp),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6.r),
                                              borderSide: BorderSide(color: TColors.primary40, width: 1.5.w), // Normal state border color
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6.r),
                                              borderSide: BorderSide(color: TColors.primary, width: 2.w), // On focus border color
                                            ),
                                            contentPadding: EdgeInsets.only(left: 15.w),
                                            hintText: "02/2028",
                                            hintStyle: TextStyle(fontFamily: "Inter",fontSize: 14.sp,color: TColors.primary40),
                                            filled: true,
                                            fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white
        
                                        ),),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 29.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("CVV",style: TextStyle(fontFamily: "Inter",fontSize: 14.sp,color: Colors.black),),
                                    SizedBox(height: 5.h),
                                    SizedBox(
                                      width: 129.w,
                                      height: 32.w,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 20.sp),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6.r),
                                              borderSide: BorderSide(color: TColors.primary40, width: 1.5.w), // Normal state border color
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6.r),
                                              borderSide: BorderSide(color: TColors.primary, width: 2.w), // On focus border color
                                            ),
                                            contentPadding: EdgeInsets.only(left: 15.w),
                                            hintText: "...",
                                            hintStyle: TextStyle(fontFamily: "Inter",fontSize: 14.sp,color: TColors.primary40),
                                            filled: true,
                                            fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white
        
                                        ),),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 75.h,),
        
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                             Transform.scale(
                               scale: 0.9,
                               child: Checkbox(
                                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                   visualDensity: VisualDensity(horizontal: -4.w, vertical: -4.h),
                                   checkColor: Colors.white,
                                   activeColor: TColors.primary,
                                   side:  BorderSide( // <-- border when unchecked
                                     color: TColors.primary40, // grey border color
                                     width: 1.5.w,
                                   ),
                                   value: save, onChanged: (value){
                                 setState(() {
                                   save = value!;
                                 });
                               }),
                             ),
                              const SizedBox(width: 0),
                               Text("Save this card for faster payment",style: TextStyle(fontSize: 13.sp,fontFamily: "Inter",color:Color(0xFFB2ADAD) ),),
                           ],
                          )
        
        
        
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 160.h,),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r)
                        ),
                        backgroundColor: TColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 100.w,vertical: 10.h),
        
                      ),
                      onLongPress: (){},
                      onPressed: (){
                      },
                      child: Text("Pay Now",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),)),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
