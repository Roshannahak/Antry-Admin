import 'package:antry_admin/model/visitorlist_model.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

class VisitorListProvider extends ChangeNotifier{
  List<Visitor> _visitorList = [];
  List<Visitor> get getVisitorList => _visitorList;
  int get visitorCount => _visitorList.length;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad){
    _isLoad = isLoad;
    notifyListeners();
  }

  void fetchVisitorListProvider()async{
    try{
      _isLoad = true;
      var response = await ApiClient.getServices().getAllVisitor();
      VisitorListModel visitorListModel = visitorListModelFromJson(response);
      _visitorList = visitorListModel.data ?? [];
      _isLoad = false;
    }catch(e){
      print("error no 4: $e");
      _isLoad = false;
    }
    notifyListeners();
  }
}