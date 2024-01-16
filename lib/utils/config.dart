// setting constants
import 'package:flutter/material.dart';
class Config{
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  // width and height initialization
  void init(BuildContext context){
    mediaQueryData = MediaQuery.of(context);
    screenHeight=mediaQueryData!.size.height;
    screenWidth=mediaQueryData!.size.width;
  }
  static get widthSize{
    return screenWidth;
  }
  static get heightSize{
    return screenHeight;
  }
  // define spacing height
  static const spaceSmall = SizedBox(height:25,);
  static final spaceMedium = SizedBox(height:screenHeight! * 0.05,);
  static final spaceBig = SizedBox(height:screenHeight! * 0.08,);

  // textform field norder
  static const outlinedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8))
  );   //OutlineInputBorder

  static const focusBorder  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
    color:Colors.greenAccent,
  )
  );   // BorderSide //OutlineInputBorder

  static const errorBorder  = OutlineInputBorder (
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
    color:Colors.red,
  )
  );  // BorderSide //OutlineInputBorder

  static const primaryColor=Colors.greenAccent;

}