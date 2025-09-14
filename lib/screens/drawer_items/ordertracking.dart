import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/appbar_theme.dart';


class Ordertracking extends StatelessWidget {
  const Ordertracking({super.key});
  static const double _stepHeight = 190;

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    final steps = [
      {
        'title': 'ORDER PLACED',
        'desc': 'Your order is placed successfully',
        'icon': Image.asset('assets/images/trackImages/ordertrack1.png'),
      },
      {
        'title': 'ON THE WAY',
        'desc': 'Your Order is placed successfully',
        'icon': Image.asset('assets/images/trackImages/ordertrack2.png'),
      },
      {
        'title': 'PRODUCT DELIVERED',
        'desc': 'Your Order is placed successfully',
        'icon': Image.asset('assets/images/trackImages/ordertrack3.png'),
      },
    ];
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
            Center(child: Text("Order Tracking",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: Colors.black),)),
            Center(child: Text("#36925781",style: TextStyle(fontFamily: "ScheherazadeNew",fontSize: 24.sp,color: TColors.primary),)),
            for (var i = 0; i < steps.length; i++)
              buildStep(
                isActive: i == 0,
                title: steps[i]['title'] as String,
                description: steps[i]['desc'] as String,
                iconWidget: steps[i]['icon'] as Widget,
                showTop: i > 0,
                showBottom: i < steps.length - 1,
                stepIndex: i,
              ),
          ],
        ),
      ),
    );
  }

  Widget buildStep({
    required bool isActive,
    required String title,
    required String description,
    required Widget iconWidget,
    required bool showTop,
    required bool showBottom,
    required int stepIndex,
  }) {
    return SizedBox(
      height: _stepHeight.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left column: top dotted, circle, bottom dotted
          SizedBox(
            width: 50.w,
            child: Column(
              children: [
                // top dotted segment (only for non-first steps)
                if (showTop)
                  Expanded(
                    child: Center(
                      child: DottedLine(
                        direction: Axis.vertical,
                        dashLength: 4,
                        dashGapLength: 3,
                        dashColor:TColors.primary40,
                        lineLength: double.infinity,
                      ),
                    ),
                  )
                else
                  SizedBox(height: 70.h),

                // the circle icon (centered)
                Container(
                  padding: EdgeInsets.all(15.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: TColors.primary40,width: 1.w),
                    shape: BoxShape.circle,
                    color: isActive ? TColors.primary : Colors.white,
                  ),
                  child: isActive
                      ? Icon(Icons.check, color: Colors.white, size: 20.r)
                      : Text(
                    stepIndex == 1 ? "2" : "3",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: TColors.primary40,
                    ),
                  ),
                ),

                // bottom dotted segment (only if not last step)
                if (showBottom)
                  Expanded(
                    child: Center(
                      child: DottedLine(
                        direction: Axis.vertical,
                        dashLength: 4,
                        dashGapLength: 2,
                        dashColor:TColors.primary40,
                        lineLength: double.infinity,
                      ),
                    ),
                  )
                else
                  SizedBox(height: 55.h),
              ],
            ),
          ),

          SizedBox(width: 9.w),

          // Middle image (the icon next to line)
          SizedBox(width: 100.w, height: 100.h, child: iconWidget),

          SizedBox(width: 9.w),
          // Right-side text block (centered vertically)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontFamily: "Inter", fontSize: 16.sp, color: Colors.black)),
                Text(description, style: TextStyle(color: const Color(0xFFB2ADAD), fontSize: 15.sp, fontFamily: "Inter")),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
