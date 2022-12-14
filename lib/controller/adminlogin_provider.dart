import 'dart:convert';

import 'package:antry_admin/model/adminlist_model.dart';
import 'package:antry_admin/routes/route.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class AdminLoginProvider extends ChangeNotifier {
  Admin _admin = Admin();
  Admin get getAdminObj => _admin;

  String _token = "";
  String get getToken => _token;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad) {
    _isLoad = isLoad;
    notifyListeners();
  }

  void loginRequestProvider(
      {required BuildContext context,
      required String empId,
      required String contactNo}) async {
    Map<String, dynamic> requestBody = {"empid": empId, "contactno": contactNo};
    try {
      _isLoad = true;
      var response = await ApiClient.getServices().loginAdminApi(requestBody);
      Map<String, dynamic> jsontomap = jsonDecode(response);
      String token = jsontomap["token"];
      _token = token;
      _admin = await decryptToken(token);
      _isLoad = false;
      Navigator.pushNamedAndRemoveUntil(
          context, RoutePath.dashboard, (route) => false);
    } catch (e) {
      print("error no 62: $e");
      _isLoad = false;
    }
    notifyListeners();
  }

  Future<Admin> decryptToken(String token) async {
    try {
      var response = await ApiClient.getServices().decryptTokenApi(token);
      Map<String, dynamic> jsontomap = jsonDecode(response);
      return Admin.fromJson(jsontomap["data"]);
    } catch (e) {
      print("error no 95: $e");
      return Admin();
    }
  }
}
