import 'package:antry_admin/model/studentlist_model.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  List<Student> _studentList = [];
  List<Student> get getStudentList => _studentList;
  int get studentCount => _studentList.length;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad) {
    _isLoad = isLoad;
    notifyListeners();
  }

  void fetchStudentListProvider() async {
    _isLoad = true;
    try {
      var response = await ApiClient.getServices().getAllStudentApi();
      StudentListModel studentListModel = studentListModelFromJson(response);
      _studentList = studentListModel.data ?? [];
      _isLoad = false;
    } catch (e) {
      print("error no 1: $e");
      _isLoad = false;
    }
    notifyListeners();
  }
}
