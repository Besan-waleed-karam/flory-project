import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/colors.dart';

class TLoaders{

  static hideSnackBar () => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

static errorSnackBar({required title , message = ''}){
  Get.snackbar(
      title,
      message,
     isDismissible: true,
    shouldIconPulse: true,
    colorText: Colors.white,
    backgroundColor: TColors.primary,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin:  EdgeInsets.all(20.r),
    icon: const Icon(Iconsax.warning_2 , color: Colors.white,)
  );
}
}