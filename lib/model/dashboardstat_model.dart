// To parse this JSON data, do
//
//     final dashboardStatModel = dashboardStatModelFromJson(jsonString);

import 'dart:convert';

DashboardStatModel dashboardStatModelFromJson(String str) => DashboardStatModel.fromJson(json.decode(str));

String dashboardStatModelToJson(DashboardStatModel data) => json.encode(data.toJson());

class DashboardStatModel {
    DashboardStatModel({
        this.data,
        this.msg,
        this.success,
    });

    Stats? data;
    String? msg;
    bool? success;

    factory DashboardStatModel.fromJson(Map<String, dynamic> json) => DashboardStatModel(
        data: Stats.fromJson(json["data"]),
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "success": success,
    };
}

class Stats {
    Stats({
        this.totalStudent,
        this.totalVisitor,
        this.totalAdmin,
        this.totalLogs,
        this.totalRooms,
    });

    String? totalStudent;
    String? totalVisitor;
    String? totalAdmin;
    String? totalLogs;
    String? totalRooms;

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        totalStudent: json["total_student"].toString(),
        totalVisitor: json["total_visitor"].toString(),
        totalAdmin: json["total_admin"].toString(),
        totalLogs: json["total_logs"].toString(),
        totalRooms: json["total_rooms"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "total_student": totalStudent,
        "total_visitor": totalVisitor,
        "total_admin": totalAdmin,
        "total_logs": totalLogs,
        "total_rooms": totalRooms,
    };
}
