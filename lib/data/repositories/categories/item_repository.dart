import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:flory/utils/exceptions/firebase_exceptions.dart';
import 'package:flory/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
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
      for (var doc in itemQuery.docs) {
        print("Doc: ${doc.id}, Data: ${doc.data()}");
      }

      List<ItemModel> items =
      itemQuery.docs.map((doc) => ItemModel.fromSnapshot(doc)).toList();
      return items;

    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e) {
      print("Error fetching items: $e");
      return [];
    }
  }
  Future<List<ItemModel>> getAllItems() async {
    try {
      final snapshot = await _db.collection('Items').get();

      return snapshot.docs
          .map((doc) => ItemModel.fromSnapshot(doc as DocumentSnapshot<Map<String, dynamic>>))
          .toList();

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong while fetching items";
    }
  }

  Future<List<ItemModel>> searchItems(String query) async {
    try {
      final String searchQuery = query.toLowerCase();
      QuerySnapshot snapshot = await _db
          .collection('Items')
          .where('name', isGreaterThanOrEqualTo: searchQuery)
          .where('name', isLessThan: searchQuery + 'z')
          .limit(20)
          .get();

      if (snapshot.docs.isEmpty) {
        snapshot = await _db
            .collection('Items')
            .where('description', isGreaterThanOrEqualTo: searchQuery)
            .where('description', isLessThan: searchQuery + 'z')
            .limit(20)
            .get();
      }

      return snapshot.docs
          .map((doc) => ItemModel.fromSnapshot(doc as DocumentSnapshot<Map<String, dynamic>>))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
  Future<List<ItemModel>> getFavouriteItems(List<String> itemIds) async {
    try {
      print("getFavouriteItems called with: $itemIds");
      // 🔹 Prevent Firestore query when list is empty
      // if (itemIds.isEmpty) {
      //   print("No favourite items to fetch.");
      //   return [];
      // }
      if (itemIds.isEmpty) return [];


      final snapshot = await _db
          .collection('Items')
          .where(FieldPath.documentId, whereIn: itemIds)
          .get();

      return snapshot.docs
          .map((querySnapshot) => ItemModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print("Error in getFavouriteItems: $e");
      throw "Something went wrong, Please try again";
    }
  }

  // Future<List<ItemModel>> getFavouriteItems(List<String> itemIds) async{
  //   try{
  //    final snapshot = await _db.collection('Items').where(FieldPath.documentId, whereIn: itemIds).get();
  //    return snapshot.docs.map((querySnapshot) => ItemModel.fromSnapshot(querySnapshot)).toList();
  //   }
  //   on FirebaseException catch (e){
  //     throw TFirebaseException(e.code).message;
  //   }on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch(e){
  //    throw "Something went wrong, Please try again";
  //   }
  // }

  // Future<List<ItemModel>> getFavouriteItems(List<String> favourites) async {
  //   if (favourites.isEmpty) {
  //     return []; // ← prevent Firestore query with empty list
  //   }
  //
  //   try {
  //     final snapshot = await FirebaseFirestore.instance
  //         .collection('items')
  //         .where(FieldPath.documentId, whereIn: favourites)
  //         .get();
  //
  //     return snapshot.docs.map((doc) => ItemModel.fromSnapshot(doc)).toList();
  //   } catch (e) {
  //     print("Error fetching favourite items: $e");
  //     return [];
  //   }
  // }



}
