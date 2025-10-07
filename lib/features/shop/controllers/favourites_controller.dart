import 'dart:convert';
import 'package:flory/data/repositories/categories/item_repository.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:flory/utils/loader/loaders.dart';
import 'package:flory/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();


  final favourites = <String,bool>{}.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // void initFavourites() {
  //   try {
  //     final raw = storage.read('favourites');
  //     if (raw != null && raw is String && raw.isNotEmpty) {
  //       final decoded = jsonDecode(raw);
  //       if (decoded is Map<String, dynamic>) {
  //         favourites.value = decoded.map((k, v) => MapEntry(k, v == true));
  //       }
  //     }
  //     print("RAW favourites in storage: $raw");
  //   } catch (e) {
  //     print("Error decoding favourites: $e");
  //     favourites.clear();
  //     //GetStorage().write('favourites', jsonEncode(favourites));
  //   }
  // }

  // void initFavourites() {
  //   try {
  //     final raw = storage.read('favourites');
  //
  //     if (raw == null || raw.toString().isEmpty) {
  //       favourites.clear();
  //       return;
  //     }
  //
  //     // Ensure raw is a String
  //     final decoded = jsonDecode(raw.toString());
  //
  //     if (decoded is Map) {
  //       // Force keys to String, values to bool
  //       favourites.value = decoded.map((k, v) =>
  //           MapEntry(k.toString(), v == true));
  //     } else {
  //       favourites.clear(); // fallback
  //     }
  //
  //     print("Loaded favourites: $favourites");
  //   } catch (e) {
  //     print("Error decoding favourites: $e");
  //     favourites.clear();
  //   }
  // }

  void initFavourites() {
    try {
      final raw = storage.read('favourites');

      if (raw == null || raw.toString().isEmpty) {
        // nothing saved yet → start empty
        favourites.clear();
        return;
      }

      final decoded = jsonDecode(raw.toString());

      if (decoded is Map) {
        favourites.value = decoded.map((k, v) => MapEntry(k.toString(), v == true));
      } else {
        favourites.clear();
      }

      print("Loaded favourites: $favourites");
    } catch (e) {
      print("Error decoding favourites: $e");
      favourites.clear();
    }
  }

  bool isFavourites(String itemId) {
    return favourites[itemId] ?? false;
  }

  void toggleFavouritesItem(String itemId) {
    if(!favourites.containsKey(itemId)){
      favourites[itemId] = true;
      saveFavouritesToStorage();
      Loaders.customToast(message: 'Item has been added to the wishlist');
    }else{
      favourites.remove(itemId);
      saveFavouritesToStorage();
      favourites.refresh();
      Loaders.customToast(message: 'Item has been removed from the wishlist');
    }
  }



  void saveFavouritesToStorage(){
    final encodedFavourites = json.encode(favourites);
    //TLocalStorage.instance().savaData('favourites', encodedFavourites);
    storage.write('favourites', encodedFavourites);
  }

  Future<List<ItemModel>> favouriteItems() async{
    return await ItemRepository.instance.getFavouriteItems(favourites.keys.toList());
  }

}
//
// TLocalStorage.instance().removeData(itemId);
// favourites.remove(itemId);
// saveFavouritesToStorage();
// favourites.refresh();
// Loaders.customToast(message: 'Item has been removed from th wishlist');



// Future<void> initFavourites() async {
//   final jsonStr = TLocalStorage.instance().readData<String>('favourites');
//
//   print("RAW favourites in storage: $jsonStr");
//   if (jsonStr != null && jsonStr.isNotEmpty) {
//     try {
//       final decoded = jsonDecode(jsonStr);
//       if (decoded is Map<String, dynamic>) {
//         favourites.assignAll(decoded.map(
//               (key, value) => MapEntry(key, value as bool),
//         ));
//       } else {
//         throw Exception("Invalid favourites format");
//       }
//     } catch (e) {
//       print("Error parsing favourites JSON: $e");
//       await TLocalStorage.instance().removeData('favourites');
//       favourites.clear();
//     }
//   }
// }

// Future<void> initFavourites() async {
//   final jsonStr = TLocalStorage.instance().readData<String>('favourites');
//
//   if (jsonStr != null && jsonStr.isNotEmpty) {
//     try {
//       final storedFavourites = jsonDecode(jsonStr) as Map<String, dynamic>;
//       favourites.assignAll(storedFavourites.map(
//             (key, value) => MapEntry(key, value as bool),
//       ));
//     } catch (e) {
//       print("Error parsing favourites JSON: $e");
//       TLocalStorage.instance().removeData('favourites');
//       favourites.clear();
//     }
//   }
// }