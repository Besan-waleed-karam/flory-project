import 'package:flory/features/shop/controllers/cart_controller.dart';
import 'package:flory/screens/navigation_items/shopping_items/checkout.dart';
import 'package:flory/widgets/animation_loader_widget.dart';
import 'package:flory/widgets/item_quantity_with_add_remove_button.dart';
import 'package:flory/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/text_theme.dart';


class ShoppingBag extends StatelessWidget {
  const ShoppingBag({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
   // final cartController =
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      //drawer: DrawerNav(),
      // appBar:
      //     dark
      //         ? TAppbarTheme.darkAppBarTheme()
      //         : TAppbarTheme.lightAppBarTheme(),
      body:Obx((){
              final emptyWidget = AnimationLoaderWidget(
                text: 'Woops! cart is empty',
                animation: TImages.loaderAsset,
                showAction: true,
                actionText: 'Let\'s fill it',
                onActionPressed: () => Get.off(() => const NavigationMenu()),

              );

              if(controller.cartItems.isEmpty){
                return emptyWidget;
              }else{
                return SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Shopping Bag",
                              style: TTextTheme.lightTextTheme.labelLarge?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontSize: 24.sp,
                                color: dark ? TColors.light : TColors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0).w,
                            child: Text(
                              "Check out now & keep the beauty.",
                              style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                                fontSize: 20.sp,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          SizedBox(height: 12.h),

                          ProductCardWithCustomization(
                            title: 'Golden Wedding Memory Frame',
                            imagePath: TImages.home1,
                            price: '\$119.9',
                          ),
                          ProductCardWithCustomization(
                            title: 'Golden Wedding Memory Frame',
                            imagePath: TImages.home1,
                            price: '\$119.9',
                          ),
                          ProductCardSimple(
                            title: 'Golden Wedding Memory Frame',
                            imagePath: TImages.home1,
                            price: '\$119.9',
                          ),
                          ProductCardSimple(
                            title: 'Golden Wedding Memory Frame',
                            imagePath: TImages.home1,
                            price: '\$119.9',
                          ),

                          SizedBox(height: 8.h),
                          Container(
                            width: double.infinity.w,
                            height: 55.h,
                            padding: EdgeInsets.fromLTRB(35.w, 5.h, 35.w, 5.h),
                            child: Stack(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: "promo code",
                                    hintStyle: TextStyle(
                                      color: TColors.primary70,
                                      fontSize: 16.sp,
                                    ),
                                    filled: true,
                                    fillColor: dark ? TColors.primary40 : TColors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide.none,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 6.w,
                                  top: 6.h,
                                  width: 97.w,
                                  height: 32.h,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: TColors.primary,
                                      //color : ,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(
                                        color: TColors.white,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.r),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "SubTotal",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '\$359.99',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                Divider(thickness: 2, color: TColors.white),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "\$4.99",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(thickness: 2, color: TColors.white),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Bag Total (3 Items)",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "\$404.99",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.h),
                                SizedBox(
                                  width: 260.w,
                                  height: 38.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Checkout(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      backgroundColor: TColors.white,
                                      foregroundColor: TColors.primary,
                                      elevation: 5,
                                      shadowColor: TColors.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.r),
                                      ),
                                    ),
                                    child: Text("Checkout"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100.h),
                        ],
                      ),
                    ),
                  ),
                );
              }

            }

            ),
);


  }
}

class ProductCardWithCustomization extends StatefulWidget {
  final String title;
  final String imagePath;
  final String price;

  const ProductCardWithCustomization({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
  });

  @override
  State<ProductCardWithCustomization> createState() =>
      _ProductCardWithCustomizationState(
        title: title,
        imagePath: imagePath,
        price: price,
      );
}

class _ProductCardWithCustomizationState
    extends State<ProductCardWithCustomization> {
  final String title;
  final String imagePath;
  final String price;

  _ProductCardWithCustomizationState({
    required this.title,
    required this.imagePath,
    required this.price,
  });

  final nameCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final msgCtrl = TextEditingController();
  final deliveryCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    dateCtrl.dispose();
    msgCtrl.dispose();
    deliveryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    String? selectedOption;
    return Obx((){
      return Stack(
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(side: BorderSide.none),
            color: dark ? TColors.blackF : TColors.primaryBackground,
            margin: EdgeInsets.symmetric(vertical: 2.h),
            child: Padding(
              padding: EdgeInsets.all(5.w.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        shadowColor: TColors.primary,
                        color: TColors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(color: TColors.primary),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.w.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                              imagePath,
                              width: 102.w,
                              height: 113.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: TColors.primary,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              price,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 33.h,
                        //width: 40.w,
                        decoration: BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                            const Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        width: 160.w,
                        height: 32.h,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                            ),
                            side: WidgetStateProperty.all(
                              BorderSide(color: TColors.primary),
                            ),
                          ),
                          onPressed: () {
                            final RenderBox renderBox = context.findRenderObject() as RenderBox;
                            final position = renderBox.localToGlobal(Offset.zero);
                            _customizationOrderDialog(context, position);
                          },
                          child: Text(
                            'Customize Your Order',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: dark ? TColors.white : TColors.blackF,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10.w),
                      Container(
                          width: 160.w,
                          height: 32.h,
                          padding: EdgeInsets.symmetric(horizontal:15.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: TColors.primary),
                            borderRadius: BorderRadius.circular(8.r),
                            color:
                            dark ? TColors.blackF : TColors.primaryBackground,
                          ),
                          child: PopupMenuButton<String>(
                            borderRadius: BorderRadius.circular(20),
                            color: dark ? TColors.black : TColors.primaryBackground,
                            position: PopupMenuPosition.under,
                            onSelected: (value) {
                              setState(() => selectedOption = value);
                              if(value == 'Use your own'){
                                final RenderBox renderBox = context.findRenderObject() as RenderBox;
                                final position = renderBox.localToGlobal(Offset.zero);
                                _cutomFlowerDialog(context, position);
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'Use your own',
                                child: Text('Use your own' ,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: dark ? Colors.white :Colors.black
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: 'Use Flory',
                                child: Text('Use Flory', style: TextStyle(
                                    fontSize: 16,
                                    color: dark ? Colors.white :Colors.black

                                ),),
                              ),
                            ],
                            child: Row(
                              children: [
                                Text(selectedOption ?? "The Flowers", style: TextStyle(
                                    fontSize: 14.sp
                                ),),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    );
  }

  void _customizationOrderDialog(BuildContext context , Offset position) {
    final dark = THelperFunctions.isDarkMode(context);
    showDialog(
      barrierColor: dark ? TColors.black.withOpacity(0.7) :TColors.primaryBackground.withOpacity(0.8),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: position.dy +130 .h,
              left: position.dx +20.w,
              child: Material(
                color: Colors.transparent,
                shadowColor: TColors.primary,
                elevation: 10,
                child: Container(
                  width: 352.w,
                  height: 365.h,
                  decoration: BoxDecoration(
                    color: dark ? TColors.black : TColors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r)
                    ),
                  ),
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDialogField(context,
                          "Name or Initials",
                          "Add a name, or just initials.",
                          nameCtrl
                      ) ,
                      _buildDialogField(context,
                          "Special Date",
                          "Wedding date, proposal day, or any moment.",
                          dateCtrl
                      ) ,
                      _buildDialogField(context,
                          "Short Message",
                          "A few words you want to keep forever",
                          msgCtrl
                      ) ,
                      Divider(
                        thickness: 1,
                        color: TColors.primary70,
                      ) ,
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customize Your Order",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: dark ? TColors.white :Colors.black,
                            ),
                          ),
                          Text(
                            "\$7.99 USD",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: dark ? TColors.white :Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      // Confirm Button
                      Center(
                        child: SizedBox(
                          width: 281.w,
                          height:40.h ,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:TColors.primary,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: TColors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _cutomFlowerDialog(BuildContext context , Offset position) {
    final dark = THelperFunctions.isDarkMode(context);
    showDialog(
      barrierColor: dark ? TColors.black.withOpacity(0.7) :TColors.primaryBackground.withOpacity(0.8),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: position.dy +130 .h,
              left: position.dx +20.w,
              child: Material(
                color: Colors.transparent,
                shadowColor: TColors.primary,
                elevation: 10,
                child: Container(
                  width: 352.w,
                  height: 477.h,
                  decoration: BoxDecoration(
                    color: dark ?TColors.black :TColors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r)
                    ),
                  ),
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDialogField(context,
                          "Name or Initials",
                          "Add a name, or just initials.",
                          nameCtrl
                      ) ,
                      _buildDialogField(context,
                          "Special Date",
                          "Wedding date, proposal day, or any moment.",
                          dateCtrl
                      ) ,

                      _buildDialogField(context,
                          "Short Message",
                          "A few words you want to keep forever",
                          msgCtrl
                      ) ,
                      _buildDialogField(
                          context,
                          "Delivery Address",
                          "Egypt , Cairo , floor 5 , apartment 23",
                          deliveryCtrl
                      ) ,
                      Divider(
                        thickness: 1,
                        color: TColors.primary70,
                      ) ,
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Frame Base Price", style: TextStyle(
                            fontSize: 16.sp,
                            color: dark ? Colors.white : Colors.black,
                          ),), Text(
                            "\$7.99 USD",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: dark ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customize Your Order",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: dark ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            "\$7.99 USD",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: dark ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      // Confirm Button
                      Center(
                        child: SizedBox(
                          width: 281.w,
                          height:40.h ,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:TColors.primary,
                              padding: EdgeInsets.zero.r,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: TColors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogField(BuildContext context ,String tittle, String hint , TextEditingController controller){
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // tittle
        Text(
          tittle,
          style: TextStyle(
            fontSize: 16.sp,
            color: dark ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 330.w,
          height: 35.h,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.w.h),
              hintText: hint,
              hintStyle: TextStyle(
                  color: TColors.primary
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                    width: 1.w,
                    color: TColors.primary70
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                    width: 1.w,
                    color: TColors.primary70
                ),
              ),
              focusedBorder:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                    width: 1.w,
                    color: TColors.primary70
                ),
              ),
            ),

          ),
        ),
        SizedBox(height: 10.h,)
      ],
    );

  }
}

class ProductCardSimple extends StatelessWidget {
  final String title;
  final String imagePath;
  final String price;

  const ProductCardSimple({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
  });


  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_,__) => const SizedBox(height: 15,),
        itemBuilder: (_, index) => Obx((){
          final item = cartController.cartItems[index];
          return SizedBox(
            width: double.infinity.w,
            height: 140.h,
            child: Obx((){
              return  Card(
                elevation: 0,
                shape: RoundedRectangleBorder(side: BorderSide.none),
                color: dark ? TColors.blackF : TColors.primaryBackground,
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Padding(
                  padding: EdgeInsets.all(5.w.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Card(
                            shadowColor: TColors.primary,
                            color: TColors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              side: BorderSide(color: TColors.primary),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.w.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.network(
                                  item.image ?? '',
                                  width: 102.w,
                                  height: 113.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: TColors.primary,
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Text((item.price * item.quantity).toStringAsFixed(1),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                           ItemQuantityWithAddRemoveButton(
                             quantity: item.quantity ,
                             add: () => cartController.addOneToCart(item),
                             remove: () => cartController.removeOneFromCart(item)
                           )

                        ],
                      ),
                    ],
                  ),
                ),
              );
            }

            ),
          );
        }),

      );
    }

    );
  }
}