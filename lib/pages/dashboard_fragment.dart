import 'package:antry_admin/components/detailcard_viewholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardFragment extends StatefulWidget {
  DashBoardFragment({Key? key}) : super(key: key);

  @override
  State<DashBoardFragment> createState() => _DashBoardFragmentState();
}

class _DashBoardFragmentState extends State<DashBoardFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DashBoard",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black54),
        ),
        SizedBox(height: 20.h),
        GridView.count(
          padding: EdgeInsets.only(right: 200),
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 14,
          childAspectRatio: 2.5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            DetailCardViewholder(
                cardTitle: "Registered Students", data: 182, icon: Icons.group),
            DetailCardViewholder(
                cardTitle: "Rooms", data: 52, icon: Icons.business),
            DetailCardViewholder(
                cardTitle: "Entry Logs", data: 1006, icon: Icons.assessment),
            DetailCardViewholder(
                cardTitle: "Checked-In",
                data: 6,
                icon: Icons.assignment_turned_in),
            DetailCardViewholder(
                cardTitle: "Admin Access",
                data: 3,
                icon: Icons.admin_panel_settings),
            DetailCardViewholder(
                cardTitle: "Total Visitors", data: 34, icon: Icons.group_sharp)
          ],
        )
      ],
    );
  }
}
