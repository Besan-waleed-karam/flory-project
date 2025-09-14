
import 'package:flory/data/repositories/categories/item_repository.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:get/get.dart';

import '../../../utils/validators/loaders.dart';

class ItemController extends GetxController{
  static ItemController get instance =>Get.find();

  final isLoading = false.obs;
  final itemRepository = Get.put(ItemRepository());
  RxList<ItemModel> featuredItems = <ItemModel>[].obs;

  @override
  void onInit() {
    // fetchFeaturedItems();
    super.onInit();
  }

  Future<List<ItemModel>> fetchFeaturedItems({required String categoryId}) async {
    try {
      final items = await itemRepository.getItemsForCategory(categoryId: categoryId);
      featuredItems.assignAll(items);   // <-- This updates the observable
      return items;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }


}