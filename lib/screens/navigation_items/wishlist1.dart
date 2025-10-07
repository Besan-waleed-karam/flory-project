import 'package:flory/data/services/shimmer_effect.dart';
import 'package:flory/features/shop/controllers/favourites_controller.dart';
import 'package:flory/screens/navigation_items/favourite_icon.dart';
import 'package:flory/utils/constants/sizes.dart';
import 'package:flory/utils/helpers/cloud_helper_functions.dart';
import 'package:flory/widgets/animation_loader_widget.dart';
import 'package:flory/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flory/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/text_theme.dart';
import '../../widgets/item_card_add_to_cart_button.dart';
import '../../widgets/search_Field.dart';
import '../detailsPage/artificialDetailsPage.dart';
import '../detailsPage/detailsPage.dart';

class Wishlist1 extends StatefulWidget {
  const Wishlist1({super.key});

  @override
  State<Wishlist1> createState() => _Wishlist1State();
}

class _Wishlist1State extends State<Wishlist1> {

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Wish List",style: TTextTheme.lightTextTheme.labelLarge?.copyWith(
                fontFamily: 'LibreBaskerville',
                fontSize: 24,
                color: dark ? TColors.light : TColors.black,
              ),
              ),  ),
              SizedBox(height: 15.h,),
              Text("Loved it? Don't lose it",style: TextStyle(fontSize: 24.sp,fontFamily: "ScheherazadeNew",color:TColors.primary)),
              SizedBox(height: 18.h,),
              SearchField.searchFiled(context),
              SizedBox(height: 10.h,),
              Container(
                padding: EdgeInsets.only(left: 0.w),
                margin: EdgeInsets.only(left: 0.w),
                child:  Obx(() {
                  return FutureBuilder(

                      future: controller.favouriteItems(),
                      builder: (context,snapshot){
                        final emptyWidget = Container(
                          height: 300.h,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: TSizes.spaceBtwSections,),
                                Icon(
                                  Iconsax.heart,
                                  size: 50.sp,
                                  color: Colors.grey[400],
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  'Your wishlist is empty',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Start adding items you love',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        );

                        const loader = TShimmerEffect(height: 23, width: 23);
                        final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader,nothingFound: emptyWidget);
                        if(widget != null) return widget;

                        final items = snapshot.data!;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context,index){
                              final item = items[index];
                              return GestureDetector(
                                onTap: () {
                                  if (item.categoryId == "3") {
                                    Get.to(() => Artificialdetailspage(item: item));
                                  } else {
                                    Get.to(() => Detailspage(item: item));
                                  }
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity.w,
                                      height: 150.h,
                                      padding:  EdgeInsets.only(bottom: 2.h),
                                      color: TColors.light,
                                      margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w,0.h),
                                      child: Container(
                                          color:dark ?TColors.blackF : TColors.primaryBackground,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 111.w,
                                                height: 122.h,
                                                margin: EdgeInsets.only(bottom: 5.h),
                                                padding: EdgeInsets.all(4.r),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(18.r)),
                                                    border: Border.all(color: TColors.primary , width: 1.w),
                                                    boxShadow: [
                                                      BoxShadow(color: TColors.primary40 , offset: Offset(0, 1.h) , spreadRadius: 1.r , blurRadius: 4.r),
                                                    ]
                                                ),
                                                child: Stack(
                                                    children:[
                                                      SizedBox(
                                                        width: 102.w,
                                                        height: 113.h,
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(14.r),
                                                          child: Image.network(item.image,
                                                              fit: BoxFit.fitWidth),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 8.h,
                                                        right: 5.w,
                                                        child: TFavouriteIcon(itemId: item.id),
                                                      )
                                                    ]
                                                ),
                                              ),
                                              Container(
                                                width: 150.w,
                                                height: 100.h,
                                                //  color: Colors.purple,
                                                padding: EdgeInsets.only(top: 6.h),
                                                margin: EdgeInsets.only(left: 15.w),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(item.name,style: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary),),
                                                    SizedBox(height: 10.h,),
                                                    Text(item.price.toString(),style: TextStyle(fontFamily: "Inter",fontSize: 16.sp,color: Colors.black)),
                                                  ],
                                                ),
                                              ),
                                               ItemCardAddToCartButton(item: item)
                                            ],

                                          )
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      color: TColors.primary,
                                    ),

                                  ],
                                ),
                              );
                            }

                        );
                      }

                  );
                }),


              ),
              SizedBox(height: 50.w,),


            ],
          ),
        ),
      ),
    );
  }
}