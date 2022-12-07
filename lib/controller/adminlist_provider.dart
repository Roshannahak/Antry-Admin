import 'package:antry_admin/model/adminlist_model.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class AdminListProvider extends ChangeNotifier {
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
}
