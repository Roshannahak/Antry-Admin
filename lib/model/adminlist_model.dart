// To parse this JSON data, do
//
//     final adminListModel = adminListModelFromJson(jsonString);

import 'dart:convert';

AdminListModel adminListModelFromJson(String str) => AdminListModel.fromJson(json.decode(str));

String adminListModelToJson(AdminListModel data) => json.encode(data.toJson());

class AdminListModel {
    AdminListModel({
        this.data,
        this.msg,
        this.success,
    });

    List<Admin>? data;
    String? msg;
    bool? success;

    factory AdminListModel.fromJson(Map<String, dynamic> json) => AdminListModel(
        data: List<Admin>.from(json["data"].map((x) => Admin.fromJson(x))),
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "success": success,
    };
}

class Admin {
    Admin({
        this.id,
        this.empid,
        this.fullname,
        this.department,
        this.contactno,
        this.superadmin,
    });

    String? id;
    String? empid;
    String? fullname;
    String? department;
    String? contactno;
    bool? superadmin;

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["_id"],
        empid: json["empid"],
        fullname: json["fullname"],
        department: json["department"],
        contactno: json["contactno"],
        superadmin: json["superadmin"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "empid": empid,
        "fullname": fullname,
        "department": department,
        "contactno": contactno,
        "superadmin": superadmin,
    };
}
