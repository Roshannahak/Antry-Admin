import 'package:antry_admin/components/log_viewholder.dart';
import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:antry_admin/res/image.dart';
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
          padding: EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Entry Logs",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ),
              ),
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

Widget logDetailsWidget() {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Log Details",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          ),
          SizedBox(height: 20),

          //user details
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.asset(userIcon, width: 80, height: 80),
                ),
                SizedBox(height: 5),
                Text(
                  "Roshan Nahak",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3),
                Text(
                  "B.Tech CSE 8",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text("Roll Number :",
                          style: TextStyle(color: Colors.black87)),
                    ),
                    Expanded(
                        flex: 6,
                        child: Text("01UG18020029",
                            style: TextStyle(color: Colors.black87))),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text("Contact No :",
                          style: TextStyle(color: Colors.black87)),
                    ),
                    Expanded(
                        flex: 6,
                        child: Text("8319312145",
                            style: TextStyle(color: Colors.black87))),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          //visit details
          Text(
            "Visited To",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.primaryColor50,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Date :")),
                    Expanded(
                        flex: 6,
                        child: Text("18-Nov-2022",
                            overflow: TextOverflow.ellipsis))
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Room :")),
                    Expanded(
                        flex: 6,
                        child: Text("Library", overflow: TextOverflow.ellipsis))
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Room No :")),
                    Expanded(
                        flex: 6,
                        child: Text("G-09", overflow: TextOverflow.ellipsis))
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Department :")),
                    Expanded(
                        flex: 6,
                        child: Text("CSE", overflow: TextOverflow.ellipsis))
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Check-in :")),
                    Expanded(
                        flex: 6,
                        child: Row(
                          children: [
                            Text("09:00", overflow: TextOverflow.ellipsis),
                            SizedBox(width: 1),
                            Icon(
                              Icons.arrow_upward_rounded,
                              size: 18.r,
                              color: Colors.green[600],
                            )
                          ],
                        ))
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Check-out :")),
                    Expanded(
                        flex: 6,
                        child: Row(
                          children: [
                            Text("17:30", overflow: TextOverflow.ellipsis),
                            SizedBox(width: 1),
                            Icon(
                              Icons.arrow_downward_rounded,
                              size: 18.r,
                              color: Colors.red[600],
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
