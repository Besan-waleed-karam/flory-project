import 'package:flory/features/shop/models/cart_item_model.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:flory/utils/loader/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();


  //variables
   RxInt noOfCartItems = 0.obs;
   RxDouble totalCartPrice = 0.0.obs;
   RxInt itemQuantityInCart = 0.obs;
   RxList<CartItemModel> cartItems  = <CartItemModel>[].obs;

   void addToCart(ItemModel item){
     //Quantity Check
     if(itemQuantityInCart.value < 1){
       Loaders.customToast(message: 'Select Quantity');
       return;
     }

     CartItemModel convertToCartItem(ItemModel item, int quantity){

       return CartItemModel(
           itemId: item.id,
           name: item.name,
           price: item.price,
           quantity: quantity,
           image: item.image,
           description: item.description,
           includes: item.includes

       );

     }

   }






}