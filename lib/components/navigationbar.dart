import 'dart:js';

import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/image.dart';

AppBar navigationBar({required bool isadmin}) => AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      leadingWidth: 160,
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Image.asset(antryLogo),
      ),
      actions: [
        Container(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 18,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(3)),
                    child: Center(
                      child: isadmin
                          ? Text(
                              "ADMIN",
                              style: userTagTextStyle(),
                            )
                          : Text(
                              "SUPER ADMIN",
                              style: userTagTextStyle(),
                            ),
                    )),
                SizedBox(width: 16),
                Text(
                  "Roshan Nahak",
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                PopupMenuButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black87),
                    splashRadius: 14,
                    iconSize: 20,
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () {},
                            height: 30.h,
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app,
                                    color: Colors.black54, size: 20.r),
                                SizedBox(width: 5.w),
                                Text("Logout",
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.black54))
                              ],
                            ),
                          )
                        ])
              ],
            ))
      ],
    );
