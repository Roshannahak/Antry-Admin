import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/components/super%20admin/adminlist_viewholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget adminListWidget() => Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 14),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    "Admin",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 26,
                        width: 26,
                        child: IconButton(
                          onPressed: () {},
                          tooltip: "Refresh",
                          splashRadius: 20,
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.refresh, color: Colors.black87),
                          iconSize: 24,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 10)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black87),
                              shadowColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          icon: Icon(Icons.add, color: Colors.white, size: 18),
                          label: Text("ADD",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12))),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 14, right: 10),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 207, 207, 207)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Emp ID",
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
                    flex: 2,
                    child: Text(
                      "Department",
                      textAlign: TextAlign.center,
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Contact No",
                      textAlign: TextAlign.center,
                      style: tableHeaderTextStyle(),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.only(top: 5),
                itemBuilder: (context, index) {
                  return AdminViewHolder(
                      empid: "469",
                      name: "Roshan Nahak",
                      department: "CSE",
                      contactno: "8319312145");
                },
                separatorBuilder: (context, index) => Divider(
                    color: Color.fromARGB(255, 218, 218, 218), height: 1),
                itemCount: 5),
          )
        ],
      ),
    );
