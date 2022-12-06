import 'package:antry_admin/controller/adminlist_provider.dart';
import 'package:antry_admin/controller/roomlist_provider.dart';
import 'package:antry_admin/controller/studentlist_provider.dart';
import 'package:antry_admin/controller/visitorlist_provider.dart';
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
              ListenableProvider(create: (context) => AdminListProvider()),
              ListenableProvider(create: (context) => RoomListProvider()),
              ListenableProvider(create: (context) => StudentListProvider()),
              ListenableProvider(create: (context) => VisitorListProvider()),
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
