import 'package:antry_admin/components/navigationbar.dart';
import 'package:antry_admin/components/side_nav_items.dart';
import 'package:antry_admin/pages/dashboard_fragment.dart';
import 'package:antry_admin/pages/entry_logs_fragment.dart';
import 'package:antry_admin/pages/profile_fragment.dart';
import 'package:antry_admin/pages/students_fragment.dart';
import 'package:antry_admin/res/strings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  List<Widget> fragment = [
    DashBoardFragment(),
    EntryLogsFragment(),
    StudentsFragment(),
    ProfileFragment(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationBar(),
      body: Row(
        children: [
          Container(
            width: 200,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: SideNavItems(
              tabs: tabs,
              selectedIndex: _selectedIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          Expanded(
              flex: 9,
              child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: fragment[_selectedIndex]))
        ],
      ),
    );
  }
}
