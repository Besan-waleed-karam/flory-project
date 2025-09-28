import 'package:flory/features/shop/controllers/favourites_controller.dart';
import 'package:flory/utils/network/network_manager.dart';
import 'package:get/get.dart';

import '../features/shop/controllers/category_controller.dart';
import '../features/shop/controllers/popular_items_controller.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  //  Get.put(FavouritesController());
  //   Get.lazyPut<PopularItemsController>(() => PopularItemsController());
   //  Get.lazyPut<CategoryController>(() => CategoryController());
  }


}