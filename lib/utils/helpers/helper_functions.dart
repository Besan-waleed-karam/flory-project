import 'dart:core';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class THelperFunctions{
  static Color? getColor(String value){
    if(value == 'Green'){
      return Colors.green;
    } else if(value == 'Red'){
      return Colors.red;
    }else if(value == 'Blue'){
      return Colors.blue;
    }else if(value == 'Pink'){
      return Colors.pink;
    }else if(value == 'Grey'){
      return Colors.grey;
    }else if(value == 'Purple'){
      return Colors.purple;
    }else if(value == 'Black'){
      return Colors.black;
    }else if(value == 'White'){
      return Colors.white;
    }else if(value == 'Brown'){
      return Colors.brown;
    }else if(value == 'Teal'){
      return Colors.teal;
    }
  }

  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }
  static void showAlert(String tittle , String message ){
    showDialog(context:Get.context!,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(tittle),
            content: Text(message),
            actions: [
              TextButton(onPressed: ()=>Navigator.of(context).pop(),
                  child: const Text("ok"))
            ],
          );
        });
  }
  static void navigateToScreen(BuildContext context , Widget screen){
    Navigator.push( context ,
        MaterialPageRoute(builder: (_)=>screen)
    );
  }
  static String turncateText(String text , int maxLength){
    if(text.length<= maxLength){
      return text;
    } else {
      return '${text.substring(0,maxLength)}...';
    }
  }
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }
  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicate<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rawSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rawSize) {
      final rawChildren = widgets.sublist(
          i, i + rawSize > widgets.length ? widgets.length : i + rawSize);
      wrappedList.add(Row(children: rawChildren,));
    }
    return wrappedList;
  }
}