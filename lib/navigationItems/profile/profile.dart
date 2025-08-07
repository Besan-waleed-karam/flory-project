import 'package:flory/navigationItems/profile/changepassword.dart';
import 'package:flory/navigationItems/profile/editprofile.dart';
import 'package:flory/navigationItems/profile/notifications.dart';
import 'package:flory/navigationItems/profile/shippingaddress.dart';
import 'package:flory/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(left: 35.0.w),
          child: Icon(Icons.arrow_back_ios_new,size: 28.sp,color: TColors.primary,),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Center(child: Text("My Profile",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: Colors.black),)),
          SizedBox(height: 80.h,),
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
           SizedBox(height: 70.h,),
           Container(
             width: 349.w,
             height: 265.h,
             color: Colors.white,
             child: Column(
           //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                     margin: EdgeInsets.only(bottom: 3.h),
                   width: 349.w,
                   height: 63.h,
                   color: TColors.primaryBackground,
                   child: Row(
                     children: [
                       Container(
                         width: 298.w,
                         height: 63.h,
                         child:TextButton(
                           onPressed: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Editprofile()));
                           },
                           style:TextButton.styleFrom(
                             alignment: Alignment.centerLeft,
                           backgroundColor: TColors.primaryBackground,
                           foregroundColor: Colors.black,
                               padding: EdgeInsets.fromLTRB(10.w,15.h,5.w,5.h)
                         ),
                           child: Text("Edit Profile",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),),
                         ),
                       ),
                      // SizedBox(width: 10.w,),
                       IconButton(onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Editprofile()));
                       }, icon: Icon(Icons.arrow_forward_ios))
                     ],
                   )

                 ),

                 Container(
                     padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                     margin: EdgeInsets.only(bottom: 3.h),
                     width: 349.w,
                     height: 63.h,
                     color: TColors.primaryBackground,
                     child: Row(
                       children: [
                         Container(
                           width: 298.w,
                           height: 63.h,
                           child:TextButton(
                             onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shippingaddress()));
                             },
                             style:TextButton.styleFrom(
                                 alignment: Alignment.centerLeft,
                                 backgroundColor: TColors.primaryBackground,
                                 foregroundColor: Colors.black,
                                 padding: EdgeInsets.fromLTRB(10.w,15.h,5.w,5.h)
                             ),
                             child: Text("Shipping Address",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),),
                           ),
                         ),
                         // SizedBox(width: 10.w,),
                         IconButton(onPressed: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shippingaddress()));
                         }, icon: Icon(Icons.arrow_forward_ios))
                       ],
                     )

                 ),
                 Container(
                     padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                     margin: EdgeInsets.only(bottom: 3.h),
                     width: 349.w,
                     height: 63.h,
                     color: TColors.primaryBackground,
                     child: Row(
                       children: [
                         Container(
                           width: 298.w,
                           height: 63.h,
                           child:TextButton(
                             onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notifications()));

                             },
                             style:TextButton.styleFrom(
                                 alignment: Alignment.centerLeft,
                                 backgroundColor: TColors.primaryBackground,
                                 foregroundColor: Colors.black,
                                 padding: EdgeInsets.fromLTRB(10.w,15.h,0.w,5.h)
                             ),
                             child: Text("Notification",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),),
                           ),
                         ),
                         // SizedBox(width: 10.w,),
                         IconButton(onPressed: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notifications()));

                         }, icon: Icon(Icons.arrow_forward_ios),
                           padding: EdgeInsets.zero,         // Remove internal padding
                           constraints: BoxConstraints(),
                         )
                       ],
                     )

                 ),
                 Container(
                     padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                     margin: EdgeInsets.only(bottom: 0.h),
                     width: 349.w,
                     height: 63.h,
                     color: TColors.primaryBackground,
                     child: Row(
                       children: [
                         Container(
                           width: 298.w,
                           height: 63.h,
                           child:TextButton(
                             onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Changepassword()));
                             },
                             style:TextButton.styleFrom(
                                 alignment: Alignment.centerLeft,
                                 backgroundColor: TColors.primaryBackground,
                                 foregroundColor: Colors.black,
                                 padding: EdgeInsets.fromLTRB(10.w,15.h,5.w,5.h)
                             ),
                             child: Text("Change Password",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),),
                           ),
                         ),
                         // SizedBox(width: 10.w,),
                         IconButton(onPressed: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Changepassword()));
                         }, icon: Icon(Icons.arrow_forward_ios))
                       ],
                     )

                 ),
               ],
             ),
           ),

           SizedBox(height: 50.h,),
           Center(
             child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20.r)
                   ),
                   backgroundColor: Colors.white,
                   foregroundColor: TColors.primary,
                   padding: EdgeInsets.symmetric(horizontal: 80.w,vertical: 10.h),

                 ),
                 onLongPress: (){},
                 onPressed: (){},
                 child: Text("Upload Photo",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),)),
           ),
         ],
       ),
      ),
    );
  }
}