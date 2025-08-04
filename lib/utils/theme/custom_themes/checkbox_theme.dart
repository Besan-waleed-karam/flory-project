import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._(); // private constructor to avoid creating instance


  // ---- customizable light text theme for checkBox
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.selected)){
          return Colors.white;
        } else {
          return Colors.black;
        }
      }) ,
      fillColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.selected)){
          return Colors.blue;
        } else{
          return Colors.transparent;
        }
      })
  );
// ---- customizable Dark text theme for checkBox
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.selected)){
          return Colors.white;
        } else {
          return Colors.black;
        }
      }) ,
      fillColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.selected)){
          return Colors.blue;
        } else{
          return Colors.transparent;
        }
      })
  );








}