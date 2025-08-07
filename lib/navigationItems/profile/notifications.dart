
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/colors.dart';
import '../../utils/theme/custom_themes/text_theme.dart';


class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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

        actions: [
          SizedBox(width: 150.w),
          CircleAvatar(
              backgroundColor: TColors.primary40,
              radius: 40.r,
              child:Icon(Icons.notifications_active_outlined,size: 50.sp,color: Colors.white,)
          ),
          SizedBox(width: 30.w),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Center(child: Text("Notification",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: Colors.black),)),
           SizedBox(height: 15.h),
           Text(
             "We’ll ship it to your address below:",
             style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
               fontSize: 20.sp,
               letterSpacing: 0,
               fontWeight: FontWeight.w400,
             ),
           ),
           SizedBox(height: 5.h,),
           Container(
             width: double.infinity,
             height: 275.h,
             color: Colors.white,
             child: Column(
               children: [
                    Container(
                      color: TColors.primaryBackground,
                      margin: EdgeInsets.only(bottom: 3.h),
                      child: ListTile(
                       title: Text("Tracking Your Order",style: TextStyle(fontFamily: "Inter",fontSize: 16.sp,color: Colors.black),),
                       subtitle: Text("We’re carefully preparing your floral keepsake.",style: TextStyle(fontSize: 15.sp,fontFamily: "Inter",color: Color(0xFFB2ADAD)),),
                       trailing:Text("30m",style: TextStyle(fontFamily: "Inter",fontSize: 16.sp,color: Color(0xFFB2ADAD)),),
                       leading: Image.asset("assets/images/ordertrack.png",width: 32.w,height: 32.h,),
                       onTap: (){
                       },
                       onLongPress: (){
                       },

                     ),
                   ),
                 Container(
                   color: TColors.primaryBackground,
                   margin: EdgeInsets.only(bottom: 4.h),
                   child: ListTile(
                     title: Text("Payment Verified",style: TextStyle(fontFamily: "Inter",fontSize: 16.sp,color: Colors.black)),
                     subtitle: Text("Thank you! Your payment has been confirmed",style: TextStyle(fontSize: 15.sp,fontFamily: "Inter",color: Color(0xFFB2ADAD)),),
                     trailing:Text("1d",style: TextStyle(fontFamily: "Inter",fontSize: 16.sp,color: Color(0xFFB2ADAD)),),
                     leading: Image.asset("assets/images/check.png",width: 32.w,height: 32.h,),
                     onTap: (){
                     },
                     onLongPress: (){
                     },

                   ),
                 ),
                 Container(
                   color: TColors.primaryBackground,
                   margin: EdgeInsets.only(bottom: 3.h),
                   child: ListTile(
                     title: Text("New Promo Just For You",style: TextStyle(fontFamily: "Inter",fontSize: 16.sp,color: Colors.black)),
                     subtitle: Text("Enjoy a special discount on your next order.",style: TextStyle(fontSize: 15.sp,fontFamily: "Inter",color: Color(0xFFB2ADAD))),
                     trailing:Text("2d",style: TextStyle(fontFamily: "Inter",fontSize: 16.sp,color: Color(0xFFB2ADAD)),),
                     leading: Image.asset("assets/images/new.png",width: 32.w,height: 32.h,),
                     onTap: (){
                     },
                     onLongPress: (){
                     },

                   ),
                 ),


               ],
             ),
           ),
           SizedBox(height:350.h,),
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
                   child: Text("Clear",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),))
           )
        ],
        ),
      ),
    );
  }
}
