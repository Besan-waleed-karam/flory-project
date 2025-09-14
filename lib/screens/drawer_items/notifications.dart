
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/appbar_theme.dart';
import '../../utils/theme/custom_themes/text_theme.dart';
import 'ordertracking.dart';



class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: dark ?TAppbarTheme.darkAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [
            SizedBox(width: 150.w),
            CircleAvatar(
                backgroundColor: TColors.primary40,
                radius: 40.r,
                child:Icon(Iconsax.notification,size: 40.sp,color: Colors.white,)
            ),
            SizedBox(width: 30.w),
          ])  :TAppbarTheme.lightAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [
            SizedBox(width: 150.w),
            CircleAvatar(
                backgroundColor: TColors.primary40,
                radius: 40.r,
                child:Icon(Iconsax.notification,size: 40.sp,color: Colors.white,)
            ),
            SizedBox(width: 30.w),
          ]) ,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Notification",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: dark ?TColors.white :Colors.black),)),
            SizedBox(height: 15.h),
            Text(
              "We’ll ship it to your address below:",
              style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                fontSize: 20.sp,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 5.h,),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  buildNotificationTile( context,
                    title: "Tracking Your Order",
                    subtitle: "We’re carefully preparing your floral keepsake.",
                    trailingTime: "30m",
                    leadingImagePath: "assets/images/notificationPageImages/ordertrack.png",
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> Ordertracking())
                      );
                    },
                    onLongPress: () {
                      // action here
                    },
                  ),
                  buildNotificationTile(context,
                    title: "Payment Verified",
                    subtitle: "Thank you! Your payment has been confirmed.",
                    trailingTime: "30m",
                    leadingImagePath: "assets/images/notificationPageImages/check.png",
                    onTap: () {
                      // action here
                    },
                    onLongPress: () {
                      // action here
                    },
                  ),
                  buildNotificationTile(context,
                    title: "New Promo Just For You",
                    subtitle: "Enjoy a special discount on your next order.",
                    trailingTime: "30m",
                    leadingImagePath: "assets/images/notificationPageImages/new.png",
                    onTap: () {
                      // action here
                    },
                    onLongPress: () {
                      // action here
                    },
                  ),

                ],
              ),
            ),
            SizedBox(height:300.h,),
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
                    child: Text("Clear",style: TextStyle(fontSize: 18.sp,fontFamily: "Inter"),))
            )
          ],
        ),
      ),
    );
  }
  Widget buildNotificationTile( BuildContext context ,{
    required String title,
    required String subtitle,
    required String trailingTime,
    required String leadingImagePath,
    VoidCallback? onTap,
    VoidCallback? onLongPress,

  }) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      color: dark ?TColors.blackF: TColors.primaryBackground,
      margin: EdgeInsets.only(bottom: 3.h),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16.sp,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: "Inter",
                color: const Color(0xFFB2ADAD),
              ),
            ),
            trailing: Text(
              trailingTime,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16.sp,
                color: const Color(0xFFB2ADAD),
              ),
            ),
            leading: Image.asset(
              leadingImagePath,
              width: 32.w,
              height: 32.h,
            ),
            onTap: onTap,
            onLongPress: onLongPress,
          ),
          Divider(
            color: TColors.white,
            thickness: 2,
          )
        ],
      ),
    );

  }
}