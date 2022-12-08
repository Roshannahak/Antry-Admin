// To parse this JSON data, do
//
//     final singleStudentLogModel = singleStudentLogModelFromJson(jsonString);

import 'dart:convert';

import 'package:antry_admin/model/studentlog_model.dart';

SingleStudentLogModel singleStudentLogModelFromJson(String str) =>
    SingleStudentLogModel.fromJson(json.decode(str));

String singleStudentLogModelToJson(SingleStudentLogModel data) =>
    json.encode(data.toJson());

class SingleStudentLogModel {
  SingleStudentLogModel({
    this.data,
    this.msg,
    this.success,
  });

  StudentLog? data;
  String? msg;
  bool? success;

  factory SingleStudentLogModel.fromJson(Map<String, dynamic> json) =>
      SingleStudentLogModel(
        data: StudentLog.fromJson(json["data"]),
        msg: json["msg"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "success": success,
      };
}
