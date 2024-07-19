import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

const Color kRedColor = Color(0xff8B1212);
const Color kWhiteColor = Colors.white;
const Color kBlueColor = Colors.blue;

TextStyle redBoldStyle = const TextStyle(
  color: kRedColor, fontWeight: FontWeight.bold,
  // fontSize: 13.sp
);

ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  primarySwatch: Colors.blue,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kBlueColor,
    selectionColor: Color.fromARGB(159, 3, 168, 244),
    selectionHandleColor: kBlueColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    // focusedBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: kBlueColor,
    //     width: 2,
    //   ),
    // ),
    // enabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: kBlueColor,
    //     width: 2,
    //   ),
    // ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kRedColor,
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kRedColor,
        width: 2,
      ),
    ),
  ),
);
