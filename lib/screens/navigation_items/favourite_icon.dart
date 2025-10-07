import 'package:flory/features/shop/controllers/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/icons/favourite_icon.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.itemId});

  final String itemId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavouritesController>();    return  Obx(() => FavouriteIcon(
      icon: Icons.favorite,
      //controller.isFavourites(itemId) ? Icons.favorite : Icons.favorite,
      color: controller.isFavourites(itemId) ? Colors.red : Colors.white,
       height: 32.h,
       width: 32.w,
      onPressed: () => controller.toggleFavouritesItem(itemId),


    )



    );
  }
}
