import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flory/features/shop/models/category_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

Future<List<CategoryModel>> getAllCategories() async{
  try{
  final snapshot = await _db.collection('categories').get();
  final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
  return list;
  }catch(e){
    throw "Something went error";
  }
}

}