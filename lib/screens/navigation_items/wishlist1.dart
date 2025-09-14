import 'package:flutter/material.dart';
import 'package:flory/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/text_theme.dart';
import '../../widgets/search_Field.dart';

class Wishlist1 extends StatefulWidget {
  const Wishlist1({super.key});

  @override
  State<Wishlist1> createState() => _Wishlist1State();
}

class _Wishlist1State extends State<Wishlist1> {
  final List items = [
    {
      "name":"Golden Wedding Memory Frame",
      "price":"\$119.9",
      "image": TImages.home2
    },
    {
      "name":"Golden Wedding Memory Frame",
      "price":"\$119.9",
      "image": TImages.home2
    },
    {
      "name":"Golden Wedding Memory Frame",
      "price":"\$119.9",
      "image": TImages.home2
    },
    {
      "name":"Golden Wedding Memory Frame",
      "price":"\$119.9",
      "image": TImages.home2
    },
    {
      "name":"Golden Wedding Memory Frame",
      "price":"\$119.9",
      "image": TImages.home2
    },
    {
      "name":"Golden Wedding Memory Frame",
      "price":"\$119.9",
      "image": TImages.home2
    },


  ];
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      //drawer: DrawerNav(),
      //appBar: dark ? TAppbarTheme.darkAppBarTheme(): TAppbarTheme.lightAppBarTheme(),
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
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      final item = items[index];
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
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
                                            Container(
                                              width: 102.w,
                                              height: 113.h,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(14.r),
                                                child:Image.asset(item["image"],fit: BoxFit.fitWidth,),),
                                            ),
                                            Positioned(
                                              top: 8.h,
                                              right: 5.w,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 20.w,
                                                height: 20.h ,
                                                decoration: BoxDecoration(
                                                    color: TColors.primary,
                                                    borderRadius: BorderRadius.all(Radius.circular(5.r))
                                                ),

                                                child:Icon(Icons.favorite,color: Colors.white,size: 11.sp,),
                                              ),
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
                                          Text(item["name"],style: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary),),
                                          SizedBox(height: 10.h,),
                                          Text(item["price"],style: TextStyle(fontFamily: "Inter",fontSize: 16.sp,color: Colors.black)),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 10.w,),
                                    Container(
                                        alignment: Alignment.center,
                                        width: 42.w,
                                        height: 22.h,
                                        padding: EdgeInsets.only(top: 0.h),
                                        margin: EdgeInsets.only(bottom: 50.h),
                                        decoration: BoxDecoration(
                                            color: TColors.primary,
                                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                                            boxShadow: [
                                              BoxShadow(color: TColors.primary40 , offset: Offset(0, 1.h) , spreadRadius: 1.r , blurRadius: 3.r),
                                            ]
                                        ),

                                        child:Icon(Icons.add,color: TColors.light,size: 17.sp,)),
                                  ],

                                )
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: TColors.primary,
                          ),

                        ],
                      );
                    }

                ),
              ),
              SizedBox(height: 50.w,),


            ],
          ),
        ),
      ),
    );
  }
}