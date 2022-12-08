import 'package:antry_admin/model/single_studentlog_model.dart';
import 'package:antry_admin/model/studentlog_model.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class SingleStudentLogProvider extends ChangeNotifier {
  StudentLog _log = StudentLog();
  StudentLog get getStudentLog => _log;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad) {
    _isLoad = isLoad;
    notifyListeners();
  }

  bool _hasData = false;
  bool get getHasData => _hasData;

  void fetchStudentLogById(String logId) async {
    try {
      _isLoad = true;
      var response = await ApiClient.getServices().singleStudentLogApi(logId);
      SingleStudentLogModel singleStudentLogModel =
          singleStudentLogModelFromJson(response);
      _log = singleStudentLogModel.data!;
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
