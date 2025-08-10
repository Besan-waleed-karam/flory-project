import 'package:flory/screens/categories/memoryframes.dart';
import 'package:flory/screens/detailsPage/detailsPage.dart';
import 'package:flory/utils/constants/colors.dart';
import 'package:flory/utils/constants/image_strings.dart';
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flory/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:flutter/material.dart';

import '../utils/theme/custom_themes/appbar_theme.dart';
import '../utils/theme/custom_themes/search_Field.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    "Memory Frames",
    "Natural Flowers",
    "Artificial Flowers",
    "Resin Blocks",
  ];
  final List items = [
    {
      "name": "Luxury Bloom Capsule",
      "price": "\$119.9",
      "image": TImages.home1,
    },
    {"name": "Hexagon Bloom", "price": "\$99.9", "image": TImages.home2},
    {
      "name": "Luxury Bloom Capsule",
      "price": "\$119.9",
      "image": TImages.home1,
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      drawer: DrawerNav(),
      appBar: dark ? TAppbarTheme.darkAppBarTheme(): TAppbarTheme.lightAppBarTheme(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(35.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Welcome",
                  style: TTextTheme.lightTextTheme.labelLarge?.copyWith(
                    fontFamily: 'LibreBaskerville',
                    fontSize: 24,
                    color: dark ? TColors.light : TColors.black,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Your stories, sealed in every flowers",
                style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 18.h),
              SearchField.searchFiled(context),
              SizedBox(height: 28.h),
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: dark ? TColors.light : TColors.black,
                ),
              ),
              SizedBox(height: 7.h),

              Container(
                width: double.infinity.w,
                height: 76.h,
                decoration: BoxDecoration(
                  // color: da TColors.light,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 5, 10, 6).r,
                      padding: EdgeInsets.fromLTRB(20, 0, 7, 0).r,
                      width: 100.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        //color: TColors.light,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        border: Border.all(color: TColors.primary, width: 1.w),
                      ),
                      child:  TextButton(
                          style:ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ) ,
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Memoryframes()));
                          },child: Text(categories[index],
                        style: TextStyle(color: TColors.primary, fontSize: 16.sp),)

                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 17.h),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0).r,
                width: double.infinity.w,
                child: Row(
                  children: [
                    Text(
                      "Popular Items",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: dark ? TColors.light : TColors.black,
                      ),
                    ),
                    SizedBox(width: 110.w),
                    Text(
                      "View All",
                      style: TextStyle(fontSize: 20.sp, color: TColors.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: double.infinity.w,
                height: 265.h,
                //  color: Colors.blue,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      padding: EdgeInsets.only(right: 10.w),
                      margin: EdgeInsets.fromLTRB(0, 0, 2, 0).h.w,
                      width: 175.w,
                      height: 250.h,
                      // color: Colors.pink,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_)=>Detailspage())
                              );
                            } ,
                            child: Container(
                              width: 145.w,
                              height: 200.h,
                              decoration: BoxDecoration(
                                color: TColors.primary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                ),
                                border: Border.all(
                                  color: TColors.primary,
                                  width: 2.w,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  item["image"],
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            item["name"],
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: dark ? TColors.light : TColors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            item["price"],
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: TColors.primary,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}