import 'dart:convert';

import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';

import '../model/roomlist_model.dart';

class RoomProvider extends ChangeNotifier {
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
    try {
      _isLoad = true;
      var response = await ApiClient.getServices().getAllRoomsApi();
      RoomListModel roomListModel = roomListModelFromJson(response);
      _roomList = roomListModel.data ?? [];
      _isLoad = false;
    } catch (e) {
      print("error no 2: $e");
      _isLoad = false;
    }
    notifyListeners();
  }

  bool _submitLoadder = false;
  bool get getSubmitLoadder => _submitLoadder;
  set setSubmitLoadder(bool submitLoadder){
    _submitLoadder = submitLoadder;
    notifyListeners();
  }
  void addRoomProvider(
      {required BuildContext context,
      required String roomNo,
      required String roomName,
      required String department}) async {
    Map<String, dynamic> body = {
      "roomno": roomNo,
      "roomname": roomName,
      "departmentname": department
    };
    try {
      _submitLoadder = true;
      var response = await ApiClient.getServices().addRoomApi(body);
      Map<String, dynamic> map = jsonDecode(response);
      bool success = map["success"];
      Room room = Room.fromJson(map["data"]);

      if (success) {
        _roomList.add(room);
        _submitLoadder = false;
        Navigator.pop(context);
      }
    } catch (e) {
      print("error no 9: $e");
      _submitLoadder = false;
    }
    notifyListeners();
  }
}
