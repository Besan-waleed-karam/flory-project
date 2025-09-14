import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:get/get.dart';

class ItemRepository extends GetxController{
  static ItemRepository get instance =>Get.find();


  final _db = FirebaseFirestore.instance;

  Future<List<ItemModel>> getItemsForCategory({required String categoryId}) async {
    try {
      print("Fetching items for categoryId: $categoryId");

      QuerySnapshot itemCategoryQuery = await _db
          .collection('ItemCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      print("ItemCategory docs: ${itemCategoryQuery.docs.length}");

      List<String> itemsIds = itemCategoryQuery.docs
          .map((doc) => doc['itemId'] as String)
          .toList();

      print("Item IDs found: $itemsIds");

      if (itemsIds.isEmpty) return [];

      final itemQuery = await _db
          .collection('Items')
          .where(FieldPath.documentId, whereIn: itemsIds)
          .get();

      print("Items docs: ${itemQuery.docs.length}");

      List<ItemModel> items =
      itemQuery.docs.map((doc) => ItemModel.fromSnapshot(doc)).toList();

      return items;
    } catch (e) {
      print("Error fetching items: $e");
      return [];
    }
  }


}
// Future<List<ItemModel>> getItemsForCategory({required String categoryId}) async{
//   try{
//  QuerySnapshot itemCategoryQuery = await _db.collection('ItemCategory').where('categoryId' , isEqualTo: categoryId).get();
//  List<String> itemsIds = itemCategoryQuery.docs.map((doc) => doc['itemId'] as String).toList();
//  final itemQuery = await _db.collection('Items').where(FieldPath.documentId , whereIn: itemsIds).get();
// List<ItemModel> items = itemQuery.docs.map((doc) => ItemModel.fromSnapshot(doc)).toList();
//  return items;
//   }catch(e){
//     throw "Something went wrong";
//   }
// }