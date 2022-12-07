import 'package:flutter/material.dart';

import '../model/roomlist_model.dart';

class PrintPreviewProvider extends ChangeNotifier {
  Room _room = Room();
  Room get getRoom => _room;
  set setRoom(Room room) {
    _room = room;
    notifyListeners();
  }
}
