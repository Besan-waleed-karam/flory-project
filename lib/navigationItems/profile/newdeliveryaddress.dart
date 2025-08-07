import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/colors.dart';
import '../../utils/theme/custom_themes/text_theme.dart';
import '../navigation_menu.dart';

class Newdeliveryaddress extends StatefulWidget {
  const Newdeliveryaddress({super.key});

  @override
  State<Newdeliveryaddress> createState() => _NewdeliveryaddressState();
}

class _NewdeliveryaddressState extends State<Newdeliveryaddress> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:dark ? TColors.black : TColors.primaryBackground,
        leading: Padding(padding: EdgeInsets.only(left: 20.0.w),
          child:IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },icon: Icon(Icons.arrow_back_ios_new ,size: 28.sp,color: TColors.primary,)
          ),

        ),


        actions: [
          SizedBox(width: 150.w),
          CircleAvatar(
              backgroundColor: TColors.primary40,
              radius: 40.r,
              child:Icon(Icons.location_on_outlined,size: 50.sp,color: Colors.white,)
          ),
          SizedBox(width: 30.w),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("New Delivery Address",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: Colors.black),)),
            SizedBox(height: 15.h),
            Text(
              "We’ll ship it to your address below:",
              style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                fontSize: 20.sp,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 18.h,),
            Text("Address Title",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: "Apartment 2",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: Colors.white

              ),),
            SizedBox(height: 22.h),
            Text("Choose Location",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: Colors.black),),
            SizedBox(height: 12.h,),
            Container(
              width: 400.w,
              height: 250.h,
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(23.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23.r),
                child: Image.asset(
                  "assets/images/map.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Text("Use My Current Location",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  prefixIcon: Icon(Icons.location_on_outlined,color: TColors.primary,size: 26,),
                  suffixIcon: Icon(Icons.arrow_forward_ios,color: TColors.primary40,size: 20,),
                  hintText: "New cairo , Rehap",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: Colors.white

              ),),
      SizedBox(height: 130.h,),
      Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)
              ),
              backgroundColor: TColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 100.w,vertical: 10.h),

            ),
            onLongPress: (){},
            onPressed: (){},
            child: Text("Save Address",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),))
      )
          ],
        )
        ,
      ),
    );
  }
}
