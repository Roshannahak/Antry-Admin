import 'package:antry_admin/components/studentlist_viewholder.dart';
import 'package:antry_admin/components/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget studentListWidget() => Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14, top: 14, bottom: 14),
            child: Text(
              "Registered Students",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 14, right: 10),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 207, 207, 207)),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Roll no",
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Name",
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Branch",
                      textAlign: TextAlign.center,
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Course",
                      textAlign: TextAlign.center,
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Semester",
                      textAlign: TextAlign.center,
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Contact no",
                      textAlign: TextAlign.center,
                      style: tableHeaderTextStyle(),
                    ),
                  )
                ],
              )),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.only(top: 5),
                itemBuilder: (context, index) {
                  return StudentViewHolder(
                      rollno: "01UG18020029",
                      name: "Roshan Nahak",
                      branch: "CSE",
                      course: "B.Tech",
                      semester: "8",
                      contactno: "8319312145");
                },
                separatorBuilder: (context, index) => Divider(
                    color: Color.fromARGB(255, 218, 218, 218), height: 1),
                itemCount: 20),
          )
        ],
      ),
    );
