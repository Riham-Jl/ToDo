import 'package:flutter/material.dart';
import 'package:todo/core/appcolors.dart';


ThemeData mytheme = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primarycolor),
  scaffoldBackgroundColor: AppColors.primarycolor,
  textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.white , fontSize: 40 , fontWeight: FontWeight.bold),
      headline2: TextStyle(
         color:Colors.white , fontSize: 20 , fontWeight: FontWeight.bold ),
         headline3: TextStyle(
          fontSize: 30 , fontWeight: FontWeight.bold)
     /* bodyText1: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),*/
     // bodyText2: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold)
     ),
  primarySwatch: Colors.teal,
);
