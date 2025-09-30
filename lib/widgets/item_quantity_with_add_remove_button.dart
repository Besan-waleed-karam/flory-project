import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/colors.dart';

class ItemQuantityWithAddRemoveButton extends StatelessWidget {
  const ItemQuantityWithAddRemoveButton({super.key, required this.quantity, this.add, this.remove});

  final int quantity;
  final VoidCallback? add,remove;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 33.h,
        //width: 40.w,
        decoration: BoxDecoration(
          color: TColors.primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                remove;
              },
              icon: Icon(
                Icons.remove,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
            Text(quantity.toString(), style: TextStyle(color: Colors.white)),
            IconButton(
              onPressed: () {
               add;
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
          ],
        )
    );
  }
}

