import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

import '../model/roomlist_model.dart';

class RoomListProvider extends ChangeNotifier {
  List<Room> _roomList = [];
  List<Room> get getRoomList => _roomList;
  int get roomCount => _roomList.length;

  bool _isLoad = false;
  bool get getIsLoad => _isLoad;
  set setIsLoad(bool isLoad) {
    _isLoad = isLoad;
    notifyListeners();
  }

  void fetchRoomListProvider() async {
    try{
      _isLoad = true;
      var response = await ApiClient.getServices().getAllRoomsApi();
      RoomListModel roomListModel = roomListModelFromJson(response);
      _roomList = roomListModel.data ?? [];
      _isLoad = false;
    }catch(e){
      print("error no 2: $e");
      _isLoad = false;
    }
    notifyListeners();
  }
}
