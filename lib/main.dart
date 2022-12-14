import 'package:antry_admin/controller/admin_provider.dart';
import 'package:antry_admin/controller/adminlogin_provider.dart';
import 'package:antry_admin/controller/dashboardstat_provider.dart';
import 'package:antry_admin/controller/print_preview_provider.dart';
import 'package:antry_admin/controller/room_provider.dart';
import 'package:antry_admin/controller/single_studentlog_provider.dart';
import 'package:antry_admin/controller/single_visitorlog_provider.dart';
import 'package:antry_admin/controller/student_provider.dart';
import 'package:antry_admin/controller/studentlog_provider.dart';
import 'package:antry_admin/controller/visitorlist_provider.dart';
import 'package:antry_admin/controller/visitorlog_provider.dart';
import 'package:antry_admin/pages/home_page.dart';
import 'package:antry_admin/pages/login_page.dart';
import 'package:antry_admin/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ScreenUtilInit(
        designSize: Size(1360, 768),
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ListenableProvider(create: (context) => AdminProvider()),
              ListenableProvider(create: (context) => RoomProvider()),
              ListenableProvider(create: (context) => StudentProvider()),
              ListenableProvider(create: (context) => VisitorListProvider()),
              ListenableProvider(create: (context) => PrintPreviewProvider()),
              ListenableProvider(create: (context) => StudentLogProvider()),
              ListenableProvider(create: (context) => VisitorLogProvider()),
              ListenableProvider(create: (context) => DashboardStatProvider()),
              ListenableProvider(create: (context) => AdminLoginProvider()),
              ListenableProvider(
                  create: (context) => SingleStudentLogProvider()),
              ListenableProvider(
                  create: (context) => SingleVisitorLogProvider()),
            ],
            child: MaterialApp(
              title: "Antry",
              debugShowCheckedModeBanner: false,
              initialRoute: RoutePath.login,
              routes: {
                RoutePath.login: (context) => LoginPage(),
                RoutePath.dashboard: (context) => HomePage(),
              },
            ),
          );
        }),
  );
}
