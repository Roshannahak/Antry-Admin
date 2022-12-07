import 'package:antry_admin/components/progress_loadder.dart';
import 'package:antry_admin/components/studentlist_viewholder.dart';
import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/controller/studentlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/studentlist_model.dart';

Widget studentListWidget(
        {required StudentListProvider provider,
        required BuildContext context}) =>
    Container(
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
                    "Registered Students",
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
                      provider.fetchStudentListProvider();
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
            child: provider.getIsLoad
                ? progressLoadder()
                : ListView.separated(
                    padding: EdgeInsets.only(top: 5),
                    itemBuilder: (context, index) {
                      Student student = provider.getStudentList[index];
                      return StudentViewHolder(
                          rollno: student.rollno!,
                          name: student.fullname!,
                          branch: student.branch!,
                          course: student.course!,
                          semester: student.semester!,
                          contactno: student.contactno!);
                    },
                    separatorBuilder: (context, index) => Divider(
                        color: Color.fromARGB(255, 218, 218, 218), height: 1),
                    itemCount: provider.studentCount),
          )
        ],
      ),
    );
