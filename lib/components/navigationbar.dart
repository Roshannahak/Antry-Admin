import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/image.dart';

AppBar navigationBar() => AppBar(
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
                ClipOval(
                  child: Container(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        userIcon,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(width: 10),
                Text(
                  "Roshan Nahak",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                PopupMenuButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.more_vert, color: Colors.black54),
                    splashRadius: 16,
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