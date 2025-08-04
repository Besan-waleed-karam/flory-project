import 'package:flory/memoryframes.dart';
import 'package:flory/screens/detailsPage/detailsPage.dart';
import 'package:flory/utils/constants/colors.dart';
import 'package:flory/utils/constants/image_strings.dart';
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flory/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:flutter/material.dart';


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
      appBar: AppBar(
        backgroundColor:dark ? TColors.black : TColors.primaryBackground,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.0.w),
          child: Icon(Icons.menu, size: 40.r),
        ),

        actions: [
          SizedBox(width: 150.w),
          CircleAvatar(
            backgroundColor: TColors.primary40,
            radius: 40.r,
            child: Image.asset(
              TImages.women,
              width: 43.w,
              height: 52.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 30.w),
        ],
      ),
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
              Container(
                width: 342.w,
                height: 40.h,
                child: TextField(
                  style: TextStyle(fontSize: 22.sp),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: const BorderSide(color: Colors.white)

                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: TColors.white
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                            TColors.primary
                        )
                    ),
                    prefixIcon: const Icon(Icons.search_outlined),
                    prefixIconColor: Color(0xff1c1c1c),
                    contentPadding: EdgeInsets.all(7.r),

                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
                    filled: true,
                    fillColor: dark ? TColors.primary40 : TColors.white,
                  ),
                ),
              ),
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
                      padding: EdgeInsets.fromLTRB(5, 0, 7, 0).r,
                      width: 100.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        //color: TColors.light,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        border: Border.all(color: TColors.primary, width: 1.w),
                      ),
                      child: TextButton(
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