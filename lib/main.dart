import 'package:antry_admin/pages/home_page.dart';
import 'package:antry_admin/pages/login_page.dart';
import 'package:antry_admin/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ScreenUtilInit(
      designSize: Size(1360, 768),
      builder: (context, child) {
        return MaterialApp(
          title: "Antry",
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePath.login,
          routes: {
            RoutePath.login: (context) => LoginPage(),
            RoutePath.dashboard: (context) => HomePage(),
          },
        );
      }
    ),
  );
}
