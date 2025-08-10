import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/appbar_theme.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Edit Profile",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color:dark?TColors.white :TColors.dark),)),
            SizedBox(height: 60.h,),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(TImages.women,width: 108.w,height: 108.h),
                  SizedBox(width: 20.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Baraa Alaydi",style: TextStyle(fontSize: 20.sp,color:dark?TColors.white :TColors.dark),),
                      Text("baraaalayde30@gmail.com",style: TextStyle(fontSize: 15.sp,color: TColors.primary),),
                      SizedBox(height: 14.h,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)
                            ),
                            backgroundColor: TColors.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 27.w,vertical: 8.h),

                          ),
                          onLongPress: (){},
                          onPressed: (){},
                          child: Text("Upload Photo",style: TextStyle(fontSize: 16.sp),)),

                    ],
                  ),

                ]
            ),
            SizedBox(height: 30.h,),
            Text("Name",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: "baraa alaydi",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white

              ),),

            SizedBox(height: 20.h),
            Text("Email",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: "baraaalaye30@gmail.com",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white

              ),),
            SizedBox(height: 20.h),
            Text("Phone Number",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: "+972 56 568 556 ",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white

              ),),
            SizedBox(height: 20.h),
            Text("Gender",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: "Female",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white

              ),),
            SizedBox(height: 40.h),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r)
                    ),
                    backgroundColor: TColors.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 140.w,vertical: 10.h),

                  ),
                  onLongPress: (){},
                  onPressed: (){},
                  child: Text("Save",style: TextStyle(fontSize: 18.sp,fontFamily: "Inter"),)),
            ),
          ],
        ),
      ),
    );
  }
}