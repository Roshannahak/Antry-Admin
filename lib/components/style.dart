import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration loginTextFieldDecoration({required String leble}) =>
    InputDecoration(
        isDense: true,
        labelText: leble,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black, width: 1.5)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)));

TextStyle tableHeaderTextStyle() => TextStyle(
    fontSize: 14.sp,
    overflow: TextOverflow.ellipsis,
    color: Colors.black,
    fontWeight: FontWeight.w600);

TextStyle tableRowTextStyle() => TextStyle(
    fontSize: 14.sp,
    overflow: TextOverflow.ellipsis,
    color: Colors.black87,
    fontWeight: FontWeight.w400);

TextStyle userTagTextStyle() => TextStyle(color: Colors.white, fontSize: 12);

InputDecoration fieldInputDecoration({required String label, String? hintText}) {
  return InputDecoration(
    isDense: true,
    labelText: label,
    hintText: hintText != null ? hintText : "",
    border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(4)),
  );
}

ButtonStyle primaryButtonStyle() => ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))));
