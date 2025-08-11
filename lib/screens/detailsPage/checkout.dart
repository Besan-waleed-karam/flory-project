import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/appbar_theme.dart';
import '../../utils/theme/custom_themes/text_theme.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedValue = "Home";
  bool isMenuOpen = false;

  final List<String> options = [
    "Home",
    "Office",
    "Add New Address",
  ];
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: dark ?TAppbarTheme.darkAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [
            SizedBox(width: 150.w),
            CircleAvatar(
                backgroundColor: TColors.primary40,
                radius: 40.r,
                child:Icon(Iconsax.notification,size: 40.sp,color: Colors.white,)
            ),
            SizedBox(width: 30.w),
          ])  :TAppbarTheme.lightAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [
            SizedBox(width: 150.w),
            CircleAvatar(
                backgroundColor: TColors.primary40,
                radius: 40.r,
                child:Icon(Iconsax.shopping_cart,size: 40.sp,color: Colors.white,)
            ),
            SizedBox(width: 30.w),
          ]) ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(child: Text("Checkout",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: dark ?TColors.white:TColors.black)),),
             SizedBox(height: 15.h),
             Text(
               "Check out now & keep the beauty.",
               style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                 fontSize: 20.sp,
                 letterSpacing: 0,
                 fontWeight: FontWeight.w400,
               ),
             ),
             SizedBox(height: 35.h,),
             Text("Name",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
             SizedBox(height: 5.h,),
             TextFormField(
               style: TextStyle(fontSize: 20.sp),
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(7.r),
                     borderSide: BorderSide.none,
                   ),
                   contentPadding: EdgeInsets.only(left: 15.w),
                   hintText: "baraa alaydi",
                   hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                   filled: true,
                   fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white
        
               ),),
        
             SizedBox(height: 45.h),
             Text("Location",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
             SizedBox(height: 5.h,),
             GestureDetector(
               onTap: () {
                 setState(() {
                   isMenuOpen = !isMenuOpen;
                 });
               },
               child: Container(
                 padding: EdgeInsets.all(11.r),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(7.r),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       selectedValue,
                       style:TextStyle(fontSize: 15.sp, fontFamily: "Inter",color: TColors.primary40),
                     ),
                      Icon(Icons.arrow_drop_down_outlined, size: 28.r),
                   ],
                 ),
               ),
             ),
        
             // Custom dropdown menu
             if (isMenuOpen)
               Container(
                 width: 400.w,
                 height: 106.h,
                 margin: EdgeInsets.only(top: 7.h),
                 decoration: BoxDecoration(
                   color: TColors.primary, // olive green background
                   borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.r)),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: options.map((option) {
                     return InkWell(
                       splashColor: Colors.transparent,
                       highlightColor: Colors.transparent,
                       hoverColor: Colors.transparent,
                       onTap: () {
                         setState(() {
                           selectedValue = option;
                           isMenuOpen = false;
                         });
                       },
                       child: Container(
                         width: 400.w,
                         decoration: BoxDecoration(
                           color: selectedValue == option
                               ? TColors.primaryBackground // highlight color
                               : Colors.transparent,
                               borderRadius: BorderRadius.circular(4.r),
                         ),
                         padding: EdgeInsets.fromLTRB(15.w,5.h,190.w,2.h),
                         margin: REdgeInsets.fromLTRB(7.w, 0.h, 7.w, 0.h),
                         child: Text(
                           option,
                           style: TextStyle(
                             fontSize: 14.sp,
                             color: selectedValue == option
                                 ? TColors.primary // text color when selected
                                 : Colors.white, // text color when not selected
                             fontFamily: "Inter",
                           ),
                         ),
                       ),
                     );
                   }).toList(),
                 ),
               ),
          SizedBox(height: 45.h),
             Text("Phone Number",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
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
                   fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white
        
               ),),
             SizedBox(height: 25.h,),
             Container(
               color: Colors.white,
               width: 349.w,
               height: 2.h,
             ),
             SizedBox(height: 27.h,),
             Row(
               children: [
                 Text(
                   "Bag Total",
                   style: TextStyle(
                     fontSize: 16.sp,
                     fontFamily: "Inter",
                   ),
                 ),
                 SizedBox(width: 75.w,),
                 Text(
                   "(3 Items)",
                   style: TextStyle(
                     fontSize: 16.sp,
                     fontFamily: "Inter",
                     color: TColors.primary40
                   ),
                 ),
                 SizedBox(width: 3.w,),
                 Text(
                   "\$404.99",
                   style: TextStyle(
                       fontSize: 20.sp,
                       fontFamily: "Inter",
                       color: Colors.black
                   ),
                 ),
                 SizedBox(width: 3.w,),
                 Text(
                   "USD",
                   style: TextStyle(
                       fontSize: 20.sp,
                       fontFamily: "Inter",
                       color: TColors.primary40
                   ),
                 ),
        
               ],
             ),
             SizedBox(height: 50.h,),
             Center(
               child: Text(
                 "Your floral keepsake will be delivered \n                on July 22, 2025.",
                 style: TextStyle(
                     fontSize: 14.sp,
                     fontWeight: FontWeight.w700,
                     fontFamily: "LibreBaskerville",
                     color: TColors.primary
                 ),
               ),
             ),
             SizedBox(height: 30.h,),
             Container(
               color: Colors.white,
               width: 349.w,
               height: 2.h,
             ),
             SizedBox(height: 75.h,),
             Center(
                 child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25.r)
                       ),
                       backgroundColor: TColors.primary,
                       foregroundColor: Colors.white,
                       padding: EdgeInsets.symmetric(horizontal: 100.w,vertical: 10.h),
        
                     ),
                     onLongPress: (){},
                     onPressed: (){},
                     child: Text("Checkout",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),))
             )
        
           ],
         ),
        ),
      ),
    );
  }
}
