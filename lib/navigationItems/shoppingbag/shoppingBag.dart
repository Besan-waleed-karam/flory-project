import 'package:flory/navigationItems/shoppingbag/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/appbar_theme.dart';
import '../../utils/theme/custom_themes/text_theme.dart';

class ShoppingBag extends StatelessWidget {
  const ShoppingBag({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: dark ? TAppbarTheme.darkAppBarTheme(): TAppbarTheme.lightAppBarTheme(),
      body: SafeArea(
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
                          fillColor: dark? TColors.primary40 :TColors.white,
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

                      Divider(thickness:2, color: TColors.white),
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
                      Container(
                        width: 281.w,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Checkout()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColors.white,
                            foregroundColor: TColors.primary,
                            elevation: 5,
                            shadowColor:TColors.primary ,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          child: Text("Checkout"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCardWithCustomization extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    String? selectedOption;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(side: BorderSide.none),
      color:  dark ? TColors.blackF : TColors.primaryBackground,
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
                        style:  TextStyle(
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
                      const Text('1', style: TextStyle(color: Colors.white)),
                      IconButton(
                        onPressed: () {},
                        icon:  Icon(
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
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(color: TColors.primary),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Customize Your Order',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color:dark? TColors.white:TColors.blackF,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  width: 160.w,
                  height: 32.h,
                  padding:  EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: TColors.primary),
                    borderRadius: BorderRadius.circular(8.r),
                    color: dark? TColors.blackF:TColors.primaryBackground,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: dark?TColors.dark : TColors.primaryBackground,
                      hint: Text(
                        "The Flower",
                        style: TextStyle(color: dark ? TColors.white:TColors.dark),
                      ),
                      value: selectedOption,
                      icon: Icon(Icons.arrow_drop_down,color: dark? TColors.white:TColors.blackF,),
                      items: [
                        DropdownMenuItem(
                          value: 'Use your own',
                          child: Text('Use your own',style: TextStyle(
                              color: dark ? TColors.white:TColors.white

                          ),),
                        ),
                        DropdownMenuItem(
                          value: 'Use Flory',
                          child: Text('Use Flory',style: TextStyle(
                              color: dark ? TColors.white:TColors.white
                          ),),
                        ),
                      ],
                      onChanged: (value) {
                        selectedOption = value!;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity.w,
      height: 140.h,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(side: BorderSide.none),
        color:  dark ? TColors.blackF : TColors.primaryBackground,
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
                        SizedBox(height: 3.h),
                        Text(
                          price,
                          style:  TextStyle(
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
                        const Text('1', style: TextStyle(color: Colors.white)),
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
            ],
          ),
        ),
      ),
    );
  }
}