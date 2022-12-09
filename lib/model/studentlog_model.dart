// To parse this JSON data, do
//
//     final studentLogModel = studentLogModelFromJson(jsonString);

import 'dart:convert';

import 'package:antry_admin/model/roomlist_model.dart';
import 'package:antry_admin/model/studentlist_model.dart';

StudentLogModel studentLogModelFromJson(String str) => StudentLogModel.fromJson(json.decode(str));

String studentLogModelToJson(StudentLogModel data) => json.encode(data.toJson());

class StudentLogModel {
    StudentLogModel({
        this.data,
        this.msg,
        this.success,
    });

    List<StudentLog>? data;
    String? msg;
    bool? success;

    factory StudentLogModel.fromJson(Map<String, dynamic> json) => StudentLogModel(
        data: List<StudentLog>.from(json["data"].map((x) => StudentLog.fromJson(x))),
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "success": success,
    };
}

class StudentLog {
    StudentLog({
        this.id,
        this.student,
        this.room,
        this.intime,
        this.outtime,
        this.reason,
    });

    String? id;
    Student? student;
    Room? room;
    String? intime;
    String? outtime;
    String? reason;

    factory StudentLog.fromJson(Map<String, dynamic> json) => StudentLog(
        id: json["_id"],
        student: Student.fromJson(json["student"]),
        room: Room.fromJson(json["room"]),
        intime: json["intime"] ?? "",
        outtime: json["outtime"] ?? "",
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "student": student?.toJson(),
        "room": room?.toJson(),
        "intime": intime,
        "outtime": outtime,
        "reason": reason,
    };
}
