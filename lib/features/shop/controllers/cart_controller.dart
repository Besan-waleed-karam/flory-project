import 'package:flory/features/shop/models/cart_item_model.dart';
import 'package:flory/features/shop/models/item_model.dart';
import 'package:flory/utils/loader/loaders.dart';
import 'package:flory/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class CartController extends GetxController{
  static CartController get instance => Get.find();
//variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt itemQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxMap<String, int> itemQuantities = <String, int>{}.obs;

   final storage = GetStorage();

// CartController(){
// loadCartItems();
// }
//
@override
 void onInit() {
  super.onInit();
  loadCartItems();
}

  void addToCart(ItemModel item,{String variantKey = ""}) {
  final qty = itemQuantities[item.id] ?? 0;
  if (qty < 1) {
    Loaders.customToast(message: 'Select Quantity'); return;
  }
    // create a CartItemModel with the selected quantity
    final selectedCartItem = convertToCartItem(item, qty);
  // if you need variant separation (customization vs simple),
    // add variantKey to CartItemModel and compare by that too.
     int index = cartItems.indexWhere((cartItem) => cartItem.itemId == selectedCartItem.itemId /* && cartItem.variantKey == selectedCartItem.variantKey */);
    if (index >= 0) {
      // increase existing cart item quantity
      cartItems[index].quantity += selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }
   // reset selected quantity for that product (optional UX)
   itemQuantities[item.id] = 0;
    updateCart();
    Loaders.customToast(message: '${item.name} added to cart');
    }
    void increaseQuantity(ItemModel item) {
    itemQuantities[item.id] = (itemQuantities[item.id] ?? 0) + 1;
   }

   void decreaseQuantity(ItemModel item) {
     final cur = (itemQuantities[item.id] ?? 0);
     if (cur > 0) itemQuantities[item.id] = cur - 1;
   }


  void addOneToCart(CartItemModel item){
  int index = cartItems.indexWhere((cartItem) => cartItem.itemId == item.itemId);
  if(index >= 0){ cartItems[index].quantity += 1;
  }else{
    cartItems.add(item);
  } updateCart();
}
void removeOneFromCart(CartItemModel item){
  int index = cartItems.indexWhere((cartItem) => cartItem.itemId == item.itemId);
  if(index >= 0){
    if(cartItems[index].quantity > 1){
      cartItems[index].quantity -= 1;
    }else{
      cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
    } updateCart();
  }
}

  void removeFromCartDialog (int index){
  Get.defaultDialog( title: "Remove Item", middleText: "Are you sure you want to remove this item?",
    onConfirm: (){
    cartItems.removeAt(index); updateCart();
    Loaders.customToast(message: 'Item removed from the Cart'); Get.back();
    },
    onCancel: () => () => Get.back(), );
}
  CartItemModel convertToCartItem(ItemModel item, int quantity){
  final isCustomization = item.categoryId == "1" || item.categoryId == "4";
  final variantKey = isCustomization ? "customization" : "simple";
  return CartItemModel(
    itemId: item.id,
    name: item.name,
    price: item.price,
    quantity: quantity,
    image: item.image,
    description: item.description,
    includes: item.includes,
    categoryId: item.categoryId,
    variantKey: variantKey.isNotEmpty ? variantKey : item.categoryId, );
}
  void updateAlreadyAddedProductCount(ItemModel item) {
  // set the selection counter to how many of this item are already in the cart
    itemQuantities[item.id] = getItemQuantityInCart(item.id);

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
    calculatedTotalPrice += (item.price) * item.quantity.toDouble(); calculatedNoOfItems += item.quantity;
  }
  totalCartPrice.value = calculatedTotalPrice;
  noOfCartItems.value = calculatedNoOfItems;
}
  void saveCartItems(){
  final cartItemsStrings = cartItems.map((item) => item.toJson()).toList();
  print("Saving cart items: $cartItemsStrings");  // 👈 Add this

  TLocalStorage.instance().saveData('cartItems', cartItemsStrings);
}

  void loadCartItems() {
  try {
     final cartItemStrings = TLocalStorage.instance().readData<List<dynamic>>('cartItems');
     print("Loaded cart items: $cartItemStrings");  // 👈 Add this

     print("Loaded cart items from storage: $cartItemStrings"); // 👈 Debug
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map( (item) => CartItemModel.fromJson(Map<String, dynamic>.from(item))));

      updateCartTotals();
    }
  } catch (e) {
    print("Cart load failed: $e");
  }
}
  int getItemQuantityInCart(String itemId){
  final foundItem = cartItems.where((item) => item.itemId == itemId).fold(0, (previousValue, element) => previousValue + element.quantity);
  return foundItem;
}
  int getQuantityInCart(String itemId){
  final foundItem = cartItems.firstWhere((item) => item.itemId == itemId,
      orElse: () => CartItemModel.empty()); return foundItem.quantity;
}

  void clearCart(){
  itemQuantityInCart.value = 0;
  cartItems.clear();
  updateCart();
}
}



