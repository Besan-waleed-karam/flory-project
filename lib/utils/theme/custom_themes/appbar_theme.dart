import 'package:flutter/material.dart';
import 'package:flory/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/image_strings.dart';

class TAppbarTheme {
  TAppbarTheme._();

  static AppBar lightAppBarTheme({Widget? leading , List<Widget>? actions}) => AppBar(
    backgroundColor: TColors.primaryBackground,
    scrolledUnderElevation: 0,
    leading: Builder(
        builder: (context) {
          return leading ?? Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: IconButton(icon:Icon(Iconsax.menu_1), iconSize: 40.r,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, ),
          );
        }
    ),
    actions: actions?? [
      SizedBox(width: 150.w),
      CircleAvatar(
        backgroundColor: TColors.primary40,
        radius: 40.r,
        child: Image.asset(
          TImages.women,
          width: 43.w,
          height: 52.h,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(width: 30.w),
    ],


  );

  static AppBar darkAppBarTheme({Widget? leading,List<Widget>? actions}) => AppBar(
    backgroundColor: TColors.blackF,
    scrolledUnderElevation: 0,
    leading:  Builder(
        builder: (context) {
          return leading ?? Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: IconButton(icon:Icon(Iconsax.menu_1), iconSize: 40.r,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, ),
          );
        }
    ),

    actions: actions?? [
      SizedBox(width: 150.w),
      CircleAvatar(
        backgroundColor: TColors.primary40,
        radius: 40.r,
        child: Image.asset(
          TImages.women,
          width: 43.w,
          height: 52.h,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(width: 30.w),
    ],


  );











}