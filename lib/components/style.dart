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
