import 'package:antry_admin/model/studentlog_model.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class StudentLogProvider extends ChangeNotifier {
  List<StudentLog> _logList = [];
  List<StudentLog> get getStudentLog => _logList;
  int get studentLogCount => _logList.length;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad) {
    _isLoad = isLoad;
    notifyListeners();
  }

  void fetchStudentLogProvider() async {
    try {
      _isLoad = true;
      var response = await ApiClient.getServices().getStudentsLogApi();
      StudentLogModel studentLogModel = studentLogModelFromJson(response);
      _logList = studentLogModel.data ?? [];
      _isLoad = false;
    } catch (e) {
      print("error no 54: $e");
      _isLoad = false;
    }
    notifyListeners();
  }
}
