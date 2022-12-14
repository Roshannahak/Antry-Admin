import 'package:antry_admin/components/navigationbar.dart';
import 'package:antry_admin/components/admin_sidenav_items.dart';
import 'package:antry_admin/components/super%20admin/sAdmin_sidenav_items%20copy.dart';
import 'package:antry_admin/controller/adminlogin_provider.dart';
import 'package:antry_admin/model/adminlist_model.dart';
import 'package:antry_admin/pages/dashboard_fragment.dart';
import 'package:antry_admin/pages/studentlogs_fragment.dart';
import 'package:antry_admin/pages/profile_fragment.dart';
import 'package:antry_admin/pages/students_fragment.dart';
import 'package:antry_admin/pages/super%20admin/admin_fragment.dart';
import 'package:antry_admin/pages/super%20admin/rooms_fragment.dart';
import 'package:antry_admin/pages/visitor_fragment.dart';
import 'package:antry_admin/pages/visitorlogs_fragment.dart';
import 'package:antry_admin/res/strings.dart';
import 'package:antry_admin/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> adminFragment = [
    DashBoardFragment(),
    StudentLogsFragment(),
    VisitorLogsFragment(),
    StudentsFragment(),
    VisitorFragment(),
    ProfileFragment(),
  ];

  List<Widget> superAdminFragment = [
    DashBoardFragment(),
    StudentLogsFragment(),
    VisitorLogsFragment(),
    StudentsFragment(),
    VisitorFragment(),
    AdminFragment(),
    RoomsFragment(),
    ProfileFragment(),
  ];
  @override
  void initState() {
    checkTokenValidation();
    super.initState();
  }

  checkTokenValidation() {
    final token =
        Provider.of<AdminLoginProvider>(context, listen: false).getToken;
    if (token.isEmpty) Navigator.pushNamed(context, RoutePath.login);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminLoginProvider>(context);
    Admin admin = provider.getAdminObj;
    return Scaffold(
      appBar:
          navigationBar(isSuperAdmin: admin.superadmin!, name: admin.fullname!),
      body: Row(
        children: [
          Container(
            width: 200,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: admin.superadmin!
                ? SAdminSideNavItems(
                    tabs: superAdminTabs,
                    selectedIndex: _selectedIndex,
                    onTabSelected: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  )
                : AdminSideNavItems(
                    tabs: adminTabs,
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
                  child: admin.superadmin!
                      ? superAdminFragment[_selectedIndex]
                      : adminFragment[_selectedIndex]))
        ],
      ),
    );
  }
}
