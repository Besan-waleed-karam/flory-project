import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class FavouriteIcon extends StatelessWidget {

    const FavouriteIcon({
      super.key,
      required this.icon,
      this.height,
      this.width,
      this.size = 16,
      this.onPressed,
      this.color,
      this.backgroundColor
});

   final double? width,height,size;
   final IconData icon;
   final Color? color;
   final Color? backgroundColor;
   final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: width,
       height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null ? backgroundColor! : THelperFunctions.isDarkMode(context)
            ?Colors.red
            :Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon , color: color, size: size,)),
    );
  }

}
