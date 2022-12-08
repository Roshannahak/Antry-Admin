import 'package:antry_admin/model/single_visitorlog_model.dart';
import 'package:antry_admin/model/visitorlog_model.dart';
import 'package:flutter/material.dart';

import '../services/network/api_client.dart';

class SingleVisitorLogProvider extends ChangeNotifier {
  VisitorLog _log = VisitorLog();
  VisitorLog get getVisitorLog => _log;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad) {
    _isLoad = isLoad;
    notifyListeners();
  }

bool _hasData = false;
  bool get getHasData => _hasData; 

  void fetchVisitorLogById(String logId) async {
    try {
      _isLoad = true;
      var response = await ApiClient.getServices().singleVisitorLogApi(logId);
      SingleVisitorLogModel singleVisitorLogModel =
          singleVisitorLogModelFromJson(response);
      _log = singleVisitorLogModel.data!;
      _isLoad = false;
      _hasData = true;
    } catch (e) {
      print("error no 65: $e");
      _isLoad = false;
      _hasData = false;
    }
    notifyListeners();
  }
}
