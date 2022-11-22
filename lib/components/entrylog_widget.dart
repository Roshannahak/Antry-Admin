import 'package:antry_admin/components/log_viewholder.dart';
import 'package:antry_admin/components/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget logsListWidget() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(7)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14, top: 14, bottom: 14),
          child: Text(
            "Entry Logs",
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
                  flex: 1,
                  child: Text(
                    "Date",
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
                    style: tableHeaderTextStyle(),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Room no",
                    textAlign: TextAlign.center,
                    style: tableHeaderTextStyle(),
                  ),
                ),
                Expanded(
                  child: Text(
                    "in",
                    textAlign: TextAlign.center,
                    style: tableHeaderTextStyle(),
                  ),
                ),
                Expanded(
                  child: Text(
                    "out",
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
                return LogViewHolder(
                    date: "19-11-2022",
                    name: "Roshan Nahak",
                    branch: "CSE",
                    roomNo: "G-09",
                    inTime: "09:00",
                    outTime: "17:30");
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Color.fromARGB(255, 218, 218, 218), height: 1),
              itemCount: 20),
        )
      ],
    ),
  );
}
