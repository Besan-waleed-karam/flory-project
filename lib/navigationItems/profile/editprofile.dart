import 'package:flutter/material.dart';
import 'package:flory/utils/constants/colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(left: 20.0.w),
          child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },icon: Icon(Icons.arrow_back_ios_new ,size: 28.sp,color: TColors.primary,)
          ),),

      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Edit Profile",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: Colors.black),)),
            SizedBox(height: 60.h,),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/IMG_2006.PNG",width: 108.w,height: 108.h),
                  SizedBox(width: 20.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Baraa Alaydi",style: TextStyle(fontSize: 20.sp,color: Colors.black),),
                      Text("baraaalayde30@gmail.com",style: TextStyle(fontSize: 15.sp,color: TColors.primary),),
                      SizedBox(height: 14.h,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)
                            ),
                            backgroundColor: TColors.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 27.w,vertical: 8.h),

                          ),
                          onLongPress: (){},
                          onPressed: (){},
                          child: Text("Upload Photo",style: TextStyle(fontSize: 16.sp),)),

                    ],
                  ),

                ]
            ),
           SizedBox(height: 30.h,),
           Text("Name",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: "baraa alaydi",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: Colors.white

              ),),

            SizedBox(height: 20.h),
            Text("Email",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: "baraaalaye30@gmail.com",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: Colors.white

              ),),
            SizedBox(height: 20.h),
            Text("Phone Number",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: "+972 56 568 556 ",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: Colors.white

              ),),
            SizedBox(height: 20.h),
            Text("Gender",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: "Female",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: Colors.white

              ),),
            SizedBox(height: 85.h),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)
                    ),
                    backgroundColor: TColors.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 110.w,vertical: 10.h),

                  ),
                  onLongPress: (){},
                  onPressed: (){},
                  child: Text("Save",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),)),
            ),
          ],
        ),
      ),
    );
  }
}
