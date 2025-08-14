import 'package:flory/navigationItems/homeScreen.dart';
import 'package:flory/navigationItems/profile/profile.dart';
import 'package:flory/navigationItems/shoppingbag/shoppingBag.dart';
import 'package:flory/navigationItems/wishlist1.dart';
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../utils/constants/colors.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return  Scaffold(
      bottomNavigationBar: Obx(
            () => Container(
          width: 281.w,
          height: 40.h,
          // padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 4.h),
          margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
          decoration: BoxDecoration(
            color: TColors.primary,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNavItem(
                  icon: Iconsax.home,
                  index: 0,
                  controller: controller,
                ),
                SizedBox(width: 30.w),
                _buildNavItem(
                  icon: Iconsax.heart,
                  index: 1,
                  controller: controller,
                ),
                SizedBox(width: 30.w),
                _buildNavItem(
                  icon: Iconsax.shopping_cart,
                  index: 2,
                  controller: controller,
                ),
                SizedBox(width: 30.w),
                _buildNavItem(
                  icon: Iconsax.user,
                  index: 3,
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),

      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [HomeScreen(), Wishlist1(), ShoppingBag(), Profile()];


}
final dark = THelperFunctions.isDarkMode(Get.context!);


Widget _buildNavItem({
  required IconData icon,
  required int index,
  required NavigationController controller,
}) {
  bool isSelected = controller.selectedIndex.value == index;
  return GestureDetector(
    onTap: () {
      controller.selectedIndex.value = index;

    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? TColors.light : TColors.primaryBackground,
          size: 22.sp,
        ),
        SizedBox(height: 3.h,),
        Container(
          width: 20.w,
          height: 1.h,
          decoration: BoxDecoration(
            color: isSelected ? TColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(1.r),
          ),
        ),
      ],
    ),
  );
}