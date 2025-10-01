import 'package:flory/features/shop/models/cart_item_model.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:flory/utils/loader/loaders.dart';
import 'package:flory/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();


  //variables
   RxInt noOfCartItems = 0.obs;
   RxDouble totalCartPrice = 0.0.obs;
   RxInt itemQuantityInCart = 0.obs;
   RxList<CartItemModel> cartItems  = <CartItemModel>[].obs;

   CartController(){
     loadCartItems();
   }

   void addToCart(ItemModel item){
     //Quantity Check
     if(itemQuantityInCart.value < 1){
       Loaders.customToast(message: 'Select Quantity');
       return;
     }

     final selectedCartItem = convertToCartItem(item,itemQuantityInCart.value);

      int index = cartItems.indexWhere((cartItems) => cartItems.itemId == selectedCartItem.itemId);
      if(index >= 0){
        cartItems[index].quantity = selectedCartItem.quantity;
      }else{
        cartItems.add(selectedCartItem);
      }
   }

   void addOneToCart(CartItemModel item){
     int index = cartItems.indexWhere((cartItem) => cartItem.itemId == item.itemId);

     if(index >= 0){
       cartItems[index].quantity += 1;
     }else{
       cartItems.add(item);
     }
     updateCart();
   }

   void removeOneFromCart(CartItemModel item){
     int index = cartItems.indexWhere((cartItem) => cartItem.itemId == item.itemId);

     if(index >= 0){
       if(cartItems[index].quantity > 1){
         cartItems[index].quantity -= 1;
       }else{
         cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
       }
       updateCart();
     }
   }

   void removeFromCartDialog (int index){
     Get.defaultDialog(
         title: "Remove Item",
         middleText: "Are you sure you want to remove this item?",
         onConfirm: (){
         cartItems.removeAt(index);
         updateCart();
         Loaders.customToast(message: 'Item removed from the Cart');
         Get.back();
     },
       onCancel: () => () => Get.back(),
     );
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


  void updateCart(){
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
   }

   void updateCartTotals(){
     double calculatedTotalPrice = 0.0;
     int calculatedNoOfItems = 0;

     for(var item in cartItems){
       calculatedTotalPrice += (item.price) * item.quantity.toDouble();
       calculatedNoOfItems += item.quantity;
     }

     totalCartPrice.value = calculatedTotalPrice;
     noOfCartItems.value = calculatedNoOfItems;
   }

   void saveCartItems(){
     final cartItemsStrings = cartItems.map((item) => item.toJson()).toList();
     TLocalStorage.instance().savaData('cartItems', cartItemsStrings);
   }

   void loadCartItems(){
     final cartItemStrings = TLocalStorage.instance().readData<List<dynamic>>('cartItems');
     if(cartItemStrings != null){
       cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String,dynamic>)));
       updateCartTotals();
     }
   }


   int getItemQuantityInCart(String itemId){
     final foundItem = cartItems.where((item) => item.itemId == itemId).fold(0, (previousValue, element) => previousValue + element.quantity);
     return foundItem;
   }

   int getQuantityInCart(String itemId){
     final foundItem = cartItems.firstWhere((item) => item.itemId == itemId,orElse: () => CartItemModel.empty());
     return foundItem.quantity;
   }

   void clearCart(){
     itemQuantityInCart.value = 0;
     cartItems.clear();
     updateCart();
   }

}

