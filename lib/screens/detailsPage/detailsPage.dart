import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/text_theme.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/details.jpg',
                  fit: BoxFit.cover,
                  width: 412.w,
                  height: 549.h,

                ),
                //  const Spacer(flex: 5),
              ],
            ),
          ),

          Positioned(
            top: 50.h,
            left: 16.w,
            child: CircleAvatar(
              backgroundColor: dark ? Colors.black : Colors.white,
              child: IconButton(
                icon: const Icon(Iconsax.arrow_left_2, color: TColors.primary),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            right: 16.w,
            child: CircleAvatar(
              backgroundColor: dark ? Colors.black : Colors.white,
              child: IconButton(
                icon: const Icon(Icons.favorite_border  , color: TColors.primary,),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            top:487.h ,
            left: 0.w,
            right: 0.w,
            bottom: 0.h,
            child: Container(
              width: 412.w,
              height: 458.h,
              padding:  EdgeInsets.all(25.r),
              decoration: BoxDecoration(
                color: dark ? TColors.dark :  TColors.primaryBackground,
                borderRadius:  BorderRadius.vertical(top: Radius.circular(30.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Golden Wedding Memory Frame',
                      style: dark ? TTextTheme.darkTextTheme.labelLarge : TTextTheme.lightTextTheme.labelLarge
                  ),
                  SizedBox(height: 30.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$119.9',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: TColors.primary,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color:TColors.primary ,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding:  EdgeInsets.symmetric(horizontal: 0.w),
                        child: Row(
                          children: [
                            IconButton(
                              icon:  Icon(Icons.remove, size: 20.sp,color: Colors.white,),
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints:  BoxConstraints(),
                            ),
                            Text('1',style:TextStyle(fontSize: 20.sp,color: Colors.white), ),
                            IconButton(
                              icon:  Icon(Icons.add, size: 20.sp,color: Colors.white),
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  Divider(
                    thickness: 2,
                    color:TColors.primary,
                  ),
                  SizedBox(height: 10.h),

                  Text(
                      'Includes',
                      style: dark ? TTextTheme.darkTextTheme.labelLarge : TTextTheme.lightTextTheme.labelLarge
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Contains your real wedding flowers, dried and preserved in crystal-clear resin.\n'
                        'Includes your original invitation and wedding date.\n'
                        'Finished in an elegant arched shape with custom floral decoration.',
                    style: TTextTheme.lightTextTheme.bodyLarge?.copyWith(
                        fontSize: 15.sp
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                      width: 281.w,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 24.w),
                          child:  Text(
                            'Add To Cart',
                            style: TextStyle(fontSize: 20.sp,
                                color: TColors.white,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),
                    ),
                  ) ,

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}