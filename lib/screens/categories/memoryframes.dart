import 'package:flory/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/appbar_theme.dart';
import '../../utils/theme/custom_themes/search_Field.dart';
import '../../utils/theme/custom_themes/text_theme.dart';

class Memoryframes extends StatefulWidget {


Memoryframes({super.key});

@override
State<Memoryframes> createState() => _MemoryframesState();
}

class _MemoryframesState extends State<Memoryframes> {
  final List items = [
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image": TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image": TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image": TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":TImages.home2
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":TImages.home2
    },

  ];
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: dark ? TAppbarTheme.darkAppBarTheme(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
            onPressed: () {
              Get.back();
            }, ),
        ),
      ) : TAppbarTheme.lightAppBarTheme(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
            onPressed: () {
              Get.back();
            }, ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Memory Frames",style: TTextTheme.lightTextTheme.labelLarge?.copyWith(
                fontFamily: 'LibreBaskerville',
                fontSize: 24.sp,
                color: dark ? TColors.light : TColors.black,),)),
              SizedBox(height: 15.h,),
              Text("In every frame, a story gently blooms",
                style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                ),),
              SizedBox(height: 18.h,),
              SearchField.searchFiled(context),
              SizedBox(height: 30.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 19.h,
                    crossAxisSpacing: 32.w
                ),
                itemCount: items.length,
                itemBuilder: (context , index){
                  final item = items[index];
                  return Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: TColors.primary,width: 1.r),
                        borderRadius: BorderRadius.circular(18.r),
                        color:Colors.white,

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 141.w,
                              height: 165.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14.r),
                                child: Image.asset(item["image"],fit: BoxFit.fill,),
                              )),
                          //const SizedBox(height: 8,),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(8.w, 0.h, 20.w, 0.h),
                                //color: Colors.purple,
                                child: Column(
                                  children: [
                                    Text(item["name"],style: TextStyle(color: Colors.grey,fontFamily: "Inter",fontSize: 15.sp),),
                                    Text(item["price"],style: TextStyle(color: Colors.black,fontFamily: "Inter",fontSize: 16.sp),),
                                  ],
                                ),
                              ),
                              SizedBox(width: 30.w,),
                              Container(
                                  alignment: Alignment.center,
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color: TColors.primary,
                                      borderRadius: BorderRadius.circular(5.r)
                                  ),
                                  child: Icon(Icons.add,color: Colors.white,size: 15.sp,)),


                            ],
                          )


                        ],
                      ));
                },

              ),

            ],
          ),
        ),
      ),
    );
  }
}
