import 'dart:convert';

import 'package:flory/data/repositories/categories/item_repository.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:flory/utils/loader/loaders.dart';
import 'package:flory/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();


  final favourites = <String,bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }


  Future<void> initFavourites() async{
   final json = TLocalStorage.instance().readData('favourites');
   if(json != null){
     final storedFavourites = jsonDecode(json) as Map<String,dynamic>;
     
     favourites.assignAll(storedFavourites.map((key,value) => MapEntry(key, value as bool)));
   }
  }

  bool isFaourites(String itemId) {
    return favourites[itemId] ?? false;
  }

  void toggleFavouritesItem(String itemId) {
    if(!favourites.containsKey(itemId)){
      favourites[itemId] = true;
      saveFavouritesToStorage();
      Loaders.customToast(message: 'Item has been added to the wishlist');
    }else{
      TLocalStorage.instance().removeData(itemId);
      favourites.remove(itemId);
      saveFavouritesToStorage();
       favourites.refresh();
       Loaders.customToast(message: 'Item has been removed from th wishlist');
    }
  }


  void saveFavouritesToStorage(){
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().savaData('favourites', encodedFavourites);
  }

  Future<List<ItemModel>> favouriteItems() async{
    return await ItemRepository.instance.getFavouriteItems(favourites.keys.toList());
  }

}