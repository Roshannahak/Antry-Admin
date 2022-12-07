import 'dart:convert';

import 'package:antry_admin/model/adminlist_model.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  List<Admin> _adminList = [];
  List<Admin> get getAdminList => _adminList;
  int get adminCount => _adminList.length;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad) {
    _isLoad = isLoad;
    notifyListeners();
  }

  void fetchAdminListProvider() async {
    try {
      _isLoad = true;
      var response = await ApiClient.getServices().getAllAdminApi();
      AdminListModel adminListModel = adminListModelFromJson(response);
      _adminList = adminListModel.data ?? [];
      _isLoad = false;
    } catch (e) {
      print("error no 5: $e");
      _isLoad = false;
    }
    notifyListeners();
  }

  bool _submitLoadder = false;
  bool get getSubmitLoadder => _submitLoadder;
  set setSubmitLoadder(bool submitLoadder) {
    _submitLoadder = submitLoadder;
    notifyListeners();
  }

  void addAdminProvider(
      {required BuildContext context,
      required String employeeId,
      required String fullName,
      required String department,
      required String contactNo}) async {
    Map<String, dynamic> body = {
      "empid": employeeId,
      "fullname": fullName,
      "department": department,
      "contactno": contactNo
    };
    try {
      _submitLoadder = true;
      var response = await ApiClient.getServices().addAdminApi(body);
      Map<String, dynamic> map = jsonDecode(response);
      bool success = map["success"];
      Admin admin = Admin.fromJson(map["data"]);

      if (success) {
        _adminList.add(admin);
        _submitLoadder = false;
        Navigator.pop(context);
      }
    } catch (e) {
      print("error no 8: $e");
      _submitLoadder = false;
    }
    notifyListeners();
  }
}
