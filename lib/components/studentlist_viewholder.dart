import 'package:antry_admin/components/style.dart';
import 'package:flutter/material.dart';

Widget StudentViewHolder(
        {required String rollno,
        required String name,
        required String branch,
        required String course,
        required String semester,
        required String contactno}) =>
    Container(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 14, right: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                rollno,
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
                textAlign: TextAlign.center,
                style: tableRowTextStyle(),
              ),
            ),
            Expanded(
              child: Text(
                course,
                textAlign: TextAlign.center,
                style: tableRowTextStyle(),
              ),
            ),
            Expanded(
              child: Text(
                semester,
                textAlign: TextAlign.center,
                style: tableRowTextStyle(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                contactno,
                textAlign: TextAlign.center,
                style: tableRowTextStyle(),
              ),
            )
          ],
        ));
