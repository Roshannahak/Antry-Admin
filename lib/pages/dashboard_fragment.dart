import 'package:antry_admin/components/detailcard_viewholder.dart';
import 'package:antry_admin/controller/dashboardstat_provider.dart';
import 'package:antry_admin/model/dashboardstat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DashBoardFragment extends StatefulWidget {
  DashBoardFragment({Key? key}) : super(key: key);

  @override
  State<DashBoardFragment> createState() => _DashBoardFragmentState();
}

class _DashBoardFragmentState extends State<DashBoardFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DashboardStatProvider>(context, listen: false)
        .fetchDashboardStatsProvider();
  }

  @override
  Widget build(BuildContext context) {
    Stats stats = Provider.of<DashboardStatProvider>(context).getStats;
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
                cardTitle: "Registered Students",
                data: stats.totalStudent,
                icon: Icons.group),
            DetailCardViewholder(
                cardTitle: "Rooms",
                data: stats.totalRooms,
                icon: Icons.business),
            DetailCardViewholder(
                cardTitle: "Entry Logs",
                data: stats.totalLogs,
                icon: Icons.assessment),
            DetailCardViewholder(
                cardTitle: "Admin Access",
                data: stats.totalAdmin,
                icon: Icons.admin_panel_settings),
            DetailCardViewholder(
                cardTitle: "Total Visitors",
                data: stats.totalVisitor,
                icon: Icons.group_sharp)
          ],
        )
      ],
    );
  }
}
