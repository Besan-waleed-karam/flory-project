import 'package:flory/navigationItems/profile/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';


import '../utils/constants/colors.dart';
import '../utils/helpers/helper_functions.dart';
import 'navigation_menu.dart';
class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Drawer(
      backgroundColor: dark ?TColors.blackF:TColors.primaryBackground,
      width: THelperFunctions.screenWidth()*0.7.w,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r) ,
              bottom: Radius.circular(0.r)
          )
      ),
      child: Container(
        padding: EdgeInsets.all(30.w.h),
        child: ListView(
          children: [
            ListTile(
              title: Text("Home"),
              leading: Icon(Iconsax.home,size: 30.sp,color: TColors.primary),
              onTap: () {
                Get.to(NavigationMenu());
              }
              ,
            ),

            ListTile(
              title: Text("Notification"),
              leading: Icon(Iconsax.notification , size: 30.sp,color: TColors.primary,),
              onTap: () {
                Get.to(Notifications());

              }
              ,
            ),
            ListTile(
              title: Text("App Mode"),
              leading: Icon(Iconsax.colorfilter
                  ,size: 30.sp,color: TColors.primary),
              onTap: () {

              }
              ,
            ),
            ListTile(
              title: Text("share"),
              leading: Icon(Iconsax.share,size: 30.sp,color: TColors.primary),
              onTap: () {

              }
              ,
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Iconsax.logout ,size: 30.sp,color: TColors.primary),
              onTap: () {

              }
              ,
            )
          ],
        ),
      ),

    );
  }
}