import 'package:cloud_firestore/cloud_firestore.dart';


class PopularItemsModel{
  String id;
  String title;
  String image;
  String description;
  num price;
  final DocumentReference? categoryRef;

  PopularItemsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    this.categoryRef
});

  static PopularItemsModel empty() => PopularItemsModel(id: '', title: '', image: '', description: '', price: 0);

  toJson(){
    return{
      'title':title,
      'image' : image,
      'description' : description,
      'price' : price,
      'categoryRef' : categoryRef
    };
  }

  factory PopularItemsModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return PopularItemsModel(
      id: document.id,
      title: data['title'] ?? '',
      image: data['image'] ?? '',
      price: data['price'] ?? 0,
      description: data['description'] ?? '',
      categoryRef: data['categoryRef'],
    );
  }
}