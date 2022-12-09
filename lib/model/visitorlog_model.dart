// To parse this JSON data, do
//
//     final visitorLogModel = visitorLogModelFromJson(jsonString);

import 'dart:convert';

import 'package:antry_admin/model/roomlist_model.dart';
import 'package:antry_admin/model/visitorlist_model.dart';

VisitorLogModel visitorLogModelFromJson(String str) =>
    VisitorLogModel.fromJson(json.decode(str));

String visitorLogModelToJson(VisitorLogModel data) =>
    json.encode(data.toJson());

class VisitorLogModel {
  VisitorLogModel({
    this.data,
    this.msg,
    this.success,
  });

  List<VisitorLog>? data;
  String? msg;
  bool? success;

  factory VisitorLogModel.fromJson(Map<String, dynamic> json) =>
      VisitorLogModel(
        data: List<VisitorLog>.from(
            json["data"].map((x) => VisitorLog.fromJson(x))),
        msg: json["msg"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "success": success,
      };
}

class VisitorLog {
  VisitorLog({
    this.id,
    this.visitor,
    this.room,
    this.intime,
    this.outtime,
    this.reason,
  });

  String? id;
  Visitor? visitor;
  Room? room;
  String? intime;
  String? outtime;
  String? reason;

  factory VisitorLog.fromJson(Map<String, dynamic> json) => VisitorLog(
        id: json["_id"],
        visitor: Visitor.fromJson(json["visitor"]),
        room: Room.fromJson(json["room"]),
        intime: json["intime"] ?? "",
        outtime: json["outtime"] ?? "",
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "visitor": visitor?.toJson(),
        "room": room?.toJson(),
        "intime": intime,
        "outtime": outtime,
        "reason": reason,
      };
}
