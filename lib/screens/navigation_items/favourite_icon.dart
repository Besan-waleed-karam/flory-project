import 'package:flory/features/shop/controllers/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/icons/favourite_icon.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.itemId});

  final String itemId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return  Obx(() => FavouriteIcon(
      icon: controller.isFavourites(itemId) ? Iconsax.heart5 : Iconsax.heart,
      color: controller.isFavourites(itemId) ? Colors.red : Colors.white,
      onPressed: () => controller.toggleFavouritesItem(itemId),


    )



    );
  }
}
