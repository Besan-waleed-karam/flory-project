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
 // final storage = GetStorage();

  bool get hasFavourites => favourites.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() {
    try {
      final raw = TLocalStorage.instance().readData('favourites');
      print("Stored favourites raw: $raw");

      if (raw == null || raw == '' || raw == '{}') {
        favourites.clear();
        return;
      }
      final decoded = jsonDecode(raw);

        if (decoded is Map<String, dynamic>) {
          favourites.value = decoded.map((k, v) => MapEntry(k, v == true));
        } else {
          favourites.clear();
          TLocalStorage.instance().saveData('favourites', jsonEncode({}));
      }
    } catch (e) {
      print("Error decoding favourites: $e");
      favourites.clear();
      TLocalStorage.instance().saveData('favourites', jsonEncode({}));
    }
  }
  // void initFavourites() {
  //   try {
  //     final raw = TLocalStorage.instance().readData('favourites');
  //
  //     if (raw != null && raw is String && raw.isNotEmpty) {
  //       final decoded = jsonDecode(raw);
  //       if (decoded is Map<String, dynamic>) {
  //         favourites.value = decoded.map((k, v) => MapEntry(k, v == true));
  //       } else {
  //         // unexpected format -> reset to empty
  //         clearFavourites();
  //       }
  //     } else {
  //       // nothing stored -> create safe empty
  //       clearFavourites();
  //     }
  //   } catch (e) {
  //     print("Error decoding favourites: $e");
  //     clearFavourites();
  //   }
  // }

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
  void saveFavouritesToStorage() {
    try {
      final encodedFavourites = jsonEncode(favourites);
      TLocalStorage.instance().saveData('favourites', encodedFavourites);
    } catch (e) {
      print("Error saving favourites: $e");
    }
  }

  Future<List<ItemModel>> favouriteItems() async {
    print("Favourites content before fetch: $favourites");

    // 🔹 Prevent repository call when favourites are empty
    if (favourites.isEmpty) {
      print("No favourites to fetch (controller).");
      return [];
    }

    try {
      final result = await ItemRepository.instance
          .getFavouriteItems(favourites.keys.toList());
      return result;
    } catch (e) {
      print("Error fetching favourite items: $e");
      return [];
    }
  }
  void clearFavourites() {
    favourites.clear();
    TLocalStorage.instance().saveData('favourites', jsonEncode({}));
    print("After removal favourites: ${favourites.keys}");

  }

}

// void initFavourites() {
//   try {
//     final raw = TLocalStorage.instance().readData('favourites');
//
//     if (raw != null && raw is String && raw.isNotEmpty) {
//       final decoded = jsonDecode(raw);
//
//       if (decoded is Map<String, dynamic>) {
//         favourites.value =
//             decoded.map((k, v) => MapEntry(k, v == true));
//       } else {
//         // if decoded is not a Map, reset
//         clearFavourites();
//       }
//     } else {
//       // if raw is null or empty, reset
//       clearFavourites();
//     }
//
//     print("RAW favourites in storage: $raw");
//   } catch (e) {
//     print("Error decoding favourites: $e");
//     clearFavourites();
//   }
// }
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