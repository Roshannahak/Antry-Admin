import 'package:antry_admin/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MaterialApp(
    title: "Antry",
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}
