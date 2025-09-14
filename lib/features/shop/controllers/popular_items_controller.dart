import 'package:flory/features/shop/models/popular_items_model.dart';
import 'package:get/get.dart';

import '../../../utils/validators/loaders.dart';

class PopularItemsController extends GetxController{
static PopularItemsController get instance => Get.find();
final isLoading = false.obs;

RxList<PopularItemsModel> popularItems = <PopularItemsModel>[].obs;


@override
  void onInit() {
    fetchPopularItems();
  }

  void fetchPopularItems() async{
    try{
       isLoading.value = true;
    }catch(e){
     TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }finally{
       isLoading.value = false;
    }
  }
}