import 'package:antry_admin/components/error_widget.dart';
import 'package:antry_admin/components/progress_loadder.dart';
import 'package:antry_admin/components/studentlog_viewholder.dart';
import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/controller/date_format.dart';
import 'package:antry_admin/controller/single_studentlog_provider.dart';
import 'package:antry_admin/controller/studentlog_provider.dart';
import 'package:antry_admin/model/roomlist_model.dart';
import 'package:antry_admin/model/studentlist_model.dart';
import 'package:antry_admin/model/studentlog_model.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:antry_admin/res/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget studentLogListWidget(BuildContext context) {
  final provider = Provider.of<StudentLogProvider>(context);
  final logDetailProvider = Provider.of<SingleStudentLogProvider>(context);
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
                  "Students Entry Logs",
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
                  onPressed: () {
                    provider.setIsLoad = true;
                    provider.fetchStudentLogProvider();
                  },
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
          child: provider.getIsLoad
              ? progressLoadder()
              : ListView.separated(
                  padding: EdgeInsets.only(top: 5),
                  itemBuilder: (context, index) {
                    StudentLog studentLog = provider.getStudentLog[index];
                    Student student = studentLog.student!;
                    Room room = studentLog.room!;
                    return GestureDetector(
                      onTap: () {
                        logDetailProvider.setIsLoad = true;
                        logDetailProvider.fetchStudentLogById(studentLog.id!);
                      },
                      child: StudentLogViewHolder(
                          date: dateFormater(
                              dateTime: studentLog.intime!,
                              formatType: FormatType.DATE),
                          name: student.fullname!,
                          branch: student.branch!,
                          roomNo: room.roomno!,
                          inTime: dateFormater(
                              dateTime: studentLog.intime!,
                              formatType: FormatType.TIME),
                          outTime: dateFormater(
                              dateTime: studentLog.outtime!,
                              formatType: FormatType.TIME)),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                      color: Color.fromARGB(255, 218, 218, 218), height: 1),
                  itemCount: provider.studentLogCount),
        )
      ],
    ),
  );
}

Widget studentLogDetailsWidget(BuildContext context) {
  final logDetailProvider = Provider.of<SingleStudentLogProvider>(context);
  StudentLog studentLog = logDetailProvider.getStudentLog;
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
          logDetailProvider.getHasData
              ? Column(
                  children: [
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
                            "${studentLog.student?.fullname!}",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "${studentLog.student?.course} ${studentLog.student?.branch} ${studentLog.student?.semester}",
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
                                  child: Text("${studentLog.student?.rollno!}",
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
                                  child: Text(
                                      "${studentLog.student?.contactno!}",
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
                          color: Colors.black87),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                  child: Text(
                                      dateFormater(
                                          dateTime: studentLog.intime!,
                                          formatType: FormatType.DATE),
                                      overflow: TextOverflow.ellipsis))
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(flex: 4, child: Text("Room :")),
                              Expanded(
                                  flex: 6,
                                  child: Text("${studentLog.room?.roomname!}",
                                      overflow: TextOverflow.ellipsis))
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(flex: 4, child: Text("Room No :")),
                              Expanded(
                                  flex: 6,
                                  child: Text("${studentLog.room?.roomno!}",
                                      overflow: TextOverflow.ellipsis))
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(flex: 4, child: Text("Department :")),
                              Expanded(
                                  flex: 6,
                                  child: Text(
                                      "${studentLog.room?.departmentname!}",
                                      overflow: TextOverflow.ellipsis))
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
                                      Text(
                                          dateFormater(
                                              dateTime: studentLog.intime!,
                                              formatType: FormatType.TIME),
                                          overflow: TextOverflow.ellipsis),
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
                                      Text(
                                          dateFormater(
                                              dateTime: studentLog.outtime!,
                                              formatType: FormatType.TIME),
                                          overflow: TextOverflow.ellipsis),
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
                    ),
                    SizedBox(height: 10),
                    //visit reason section
                    Container(
                      width: 1.sw,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColor.hoverGrey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Reason for visit",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${studentLog.reason}",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          )
                        ],
                      ),
                    )
                  ],
                )
              : noDataWidget()
        ],
      ),
    ),
  );
}
