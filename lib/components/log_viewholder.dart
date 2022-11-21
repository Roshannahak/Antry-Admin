import 'package:antry_admin/components/style.dart';
import 'package:flutter/material.dart';

Widget logViewHolder(
        {required String date,
        required String name,
        required String branch,
        required String roomNo,
        required String inTime,
        required String outTime}) =>
    Container(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 14, right: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                date,
                style: tableRowTextStyle(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                name,
                style: tableRowTextStyle(),
              ),
            ),
            Expanded(
              child: Text(
                branch,
                style: tableRowTextStyle(),
              ),
            ),
            Expanded(
              child: Text(
                roomNo,
                textAlign: TextAlign.center,
                style: tableRowTextStyle(),
              ),
            ),
            Expanded(
              child: Text(
                inTime,
                textAlign: TextAlign.center,
                style: tableRowTextStyle(),
              ),
            ),
            Expanded(
              child: Text(
                outTime,
                textAlign: TextAlign.center,
                style: tableRowTextStyle(),
              ),
            )
          ],
        ));
