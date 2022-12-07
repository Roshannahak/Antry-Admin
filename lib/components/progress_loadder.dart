import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget progressLoadder() {
  return Center(
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 25.r,
              width: 25.r,
              child: CircularProgressIndicator(
                  color: AppColor.primaryColor, strokeWidth: 3)),
          SizedBox(width: 10),
          Text("Loading...",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600))
        ],
      ),
    ),
  );
}
