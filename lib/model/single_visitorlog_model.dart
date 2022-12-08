// To parse this JSON data, do
//
//     final singleVisitorLogModel = singleVisitorLogModelFromJson(jsonString);

import 'dart:convert';

import 'package:antry_admin/model/visitorlog_model.dart';

SingleVisitorLogModel singleVisitorLogModelFromJson(String str) => SingleVisitorLogModel.fromJson(json.decode(str));

String singleVisitorLogModelToJson(SingleVisitorLogModel data) => json.encode(data.toJson());

class SingleVisitorLogModel {
    SingleVisitorLogModel({
        this.data,
        this.msg,
        this.success,
    });

    VisitorLog? data;
    String? msg;
    bool? success;

    factory SingleVisitorLogModel.fromJson(Map<String, dynamic> json) => SingleVisitorLogModel(
        data: VisitorLog.fromJson(json["data"]),
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "success": success,
    };
}