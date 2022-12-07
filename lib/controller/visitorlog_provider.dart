import 'package:antry_admin/model/visitorlog_model.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class VisitorLogProvider extends ChangeNotifier {
  List<VisitorLog> _logList = [];
  List<VisitorLog> get getVsitorLog => _logList;
  int get visitorLogCount => _logList.length;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad) {
    _isLoad = isLoad;
    notifyListeners();
  }

  void fetchVisitorLogProvider() async {
    try {
      _isLoad = true;
      var response = await ApiClient.getServices().getVisitorLogApi();
      VisitorLogModel visitorLogModel = visitorLogModelFromJson(response);
      _logList = visitorLogModel.data ?? [];
      _isLoad = false;
    } catch (e) {
      print("error no 23: $e");
      _isLoad = false;
    }
    notifyListeners();
  }
}
