import 'package:flutter/material.dart';

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
                )
              ],
            ))
      ],
    );
