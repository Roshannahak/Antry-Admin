import 'package:antry_admin/model/dashboardstat_model.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class DashboardStatProvider extends ChangeNotifier {
  Stats _stats = Stats();
  Stats get getStats => _stats;

  void fetchDashboardStatsProvider() async {
    try {
      var response = await ApiClient.getServices().getStatsApi();
      DashboardStatModel dashboardStatModel = dashboardStatModelFromJson(response);
      _stats = dashboardStatModel.data!;
    } catch (e) {
      print("error no 69: $e");
    }
    notifyListeners();
  }
}
