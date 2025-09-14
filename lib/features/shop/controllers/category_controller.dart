import 'package:flory/data/repositories/categories/category_repository.dart';
import 'package:flory/data/repositories/categories/item_repository.dart';
import 'package:flory/features/shop/models/category_model.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:flory/utils/validators/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  static CategoryController get instance => Get.find();

  final isLoading = false.obs;

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;


  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }



  Future<void> fetchCategories() async{
    try{
    isLoading.value = true;

    final categories = await _categoryRepository.getAllCategories();

    print("Fetched Categories: ${categories.map((c) => '${c.name}, parentId: ${c.parentId}, isFeatured: ${c.isFeatured}').toList()}");

    allCategories.assignAll(categories);
    featuredCategories.assignAll(
        allCategories.where((category) => category.isFeatured).take(4).toList()
    );
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }


}

// Future<List<ItemModel>> getItems({required String categoryId}) async{
//   try{
//     final items = await ItemRepository.instance.getItemsForCategory(categoryId: categoryId);
//     return items;
//   }catch(e){
//     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     return [];
//   }
//
// }
