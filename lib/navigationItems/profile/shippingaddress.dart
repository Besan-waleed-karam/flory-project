import 'package:flory/navigationItems/profile/newdeliveryaddress.dart';
import 'package:flory/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/theme/custom_themes/text_theme.dart';
import '../navigation_menu.dart';

class Shippingaddress extends StatefulWidget {
  const Shippingaddress({super.key});

  @override
  State<Shippingaddress> createState() => _ShippingaddressState();
}

class _ShippingaddressState extends State<Shippingaddress> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:dark ? TColors.black : TColors.primaryBackground,
        leading: Padding(padding: EdgeInsets.only(left: 20.0.w),
          child: IconButton(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Shipping Address",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: Colors.black),)),
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
            buildSendToAddressOption(
              index: 0,
              iconWidget: Image.asset("assets/images/office.png"),
              title: "My Office",
            ),
             SizedBox(height: 20.h),
            buildSendToAddressOption(
              index: 1,
              iconWidget: Image.asset("assets/images/homeimage.png"),
              title: "My Home",
            ),
           SizedBox(height: 30.h),
            Container(
              width: 349.w,
              height:2.h,
              color: Colors.white,
            ),
            SizedBox(height: 50.h),
            _buildNewAddressOption(
              index: 2,
              title: "Add New Delivery Address",
              iconWidget: Image.asset("assets/images/location.png"),
            ),
            SizedBox(height: 280.h),
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
                  child: Text("Save Changes",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),)),
            ),


          ],

        ),
      ),
    );
  }



  Widget buildSendToAddressOption({
    required int index,
    required Widget iconWidget, // 👈 image or icon
    required String title,

  })
  {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:  EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: TColors.primary,
              blurRadius: 10,
              offset: Offset(0.h, 4.h),
            ),
          ]
              : [],
        ),
        child: Row(
          children: [
            // Radio Circle
            Container(
              width: 24.w,
              height: 24.h,
              padding:  EdgeInsets.all(3.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFB2ADAD), width: 2.w),
              ),
              child: isSelected
                  ? Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TColors.primary,
                ),
              )
                  : null,
            ),
             SizedBox(width: 16.w),

            // Icon
            SizedBox(width: 32.w, height: 32.h, child: iconWidget),

             SizedBox(width: 16.w),

            // Texts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "SEND TO",
                  style: TextStyle(
                    color:Color(0xFFB2ADAD),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter"
                  ),
                ),
                Text(
                  title,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Edit Icon
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Newdeliveryaddress()));

                  },
                icon: Icon(Icons.edit_outlined), color: TColors.primary,
                  padding: EdgeInsets.zero,         // Remove internal padding
                  constraints: BoxConstraints(),
                ),
                 SizedBox(height: 2.h), // spacing between icon and line
                Transform.translate(
                  offset:  Offset(0.h, -12.h), // Moves the line up
                  child: Container(
                    width: 20.w,
                    height: 1.5.h,
                    color: TColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewAddressOption({
    required int index,
    required String title,
    required Widget iconWidget,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Row(
        children: [
          _buildRadioCircle(isSelected),
           SizedBox(width: 16.w),

          // Icon
          SizedBox(width: 32.w, height: 32.h, child: iconWidget),
          SizedBox(width: 16.w),

          // Text
          Text(
            title,
            style:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Inter"
            ),
          ),
          const Spacer(),

          // Edit Icon
          _buildEditIcon(),
        ],
      ),
    );
  }

  Widget _buildRadioCircle(bool isSelected) {
    return Container(
      width: 24.w,
      height: 24.h,
      padding:  EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFFB2ADAD), width: 2.w),
      ),
      child: isSelected
          ? Container(
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: TColors.primary,
        ),
      )
          : null,
    );
  }
  Widget _buildEditIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Newdeliveryaddress()));
            },
            icon: Icon(Icons.edit_outlined), color: TColors.primary,
          padding: EdgeInsets.zero,         // Remove internal padding
          constraints: BoxConstraints(),

        ),
       // const SizedBox(height: 2),
        Transform.translate(
          offset:  Offset(0.h, -9.h), // Moves the line up
          child: Container(
            width: 20.w,
            height: 1.5.h,
            color: TColors.primary,
          ),
        ),
       //  Container(width: 20, height: 1.5, color: TColors.primary),
      ],
    );
  }


}
