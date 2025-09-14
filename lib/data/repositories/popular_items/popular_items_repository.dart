import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flory/data/services/firebase_storage_service.dart';
import 'package:flory/features/shop/models/popular_items_model.dart';
import 'package:get/get.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class PopularItemsRepository extends GetxController{
  static PopularItemsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


// Future<void> uploadDummyData(List<PopularItemsModel> products) async{
//   try{
//  //final storage = Get.put(FirebaseStorageService());
//     final storage = Get.put(TFirebaseStorageService());
//     for(var product in products){
//       final thumbnail = await storage.getImageDataFromAssets(product.thumbnail!.toString());
//       final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());
//       product.thumbnail= url;
//     }
//   }catch(e){
//
//   }
// }
}