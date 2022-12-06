// To parse this JSON data, do
//
//     final roomListModel = roomListModelFromJson(jsonString);

import 'dart:convert';

RoomListModel roomListModelFromJson(String str) => RoomListModel.fromJson(json.decode(str));

String roomListModelToJson(RoomListModel data) => json.encode(data.toJson());

class RoomListModel {
    RoomListModel({
        this.data,
        this.msg,
        this.success,
    });

    List<Room>? data;
    String? msg;
    bool? success;

    factory RoomListModel.fromJson(Map<String, dynamic> json) => RoomListModel(
        data: List<Room>.from(json["data"].map((x) => Room.fromJson(x))),
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "success": success,
    };
}

class Room {
    Room({
        this.id,
        this.roomno,
        this.roomname,
        this.departmentname,
        this.created,
    });

    String? id;
    String? roomno;
    String? roomname;
    String? departmentname;
    DateTime? created;

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["_id"],
        roomno: json["roomno"],
        roomname: json["roomname"],
        departmentname: json["departmentname"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "roomno": roomno,
        "roomname": roomname,
        "departmentname": departmentname,
        "created": "${created?.year.toString().padLeft(4, '0')}-${created?.month.toString().padLeft(2, '0')}-${created?.day.toString().padLeft(2, '0')}",
    };
}
