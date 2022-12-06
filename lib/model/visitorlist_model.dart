// To parse this JSON data, do
//
//     final visitorListModel = visitorListModelFromJson(jsonString);

import 'dart:convert';

VisitorListModel visitorListModelFromJson(String str) => VisitorListModel.fromJson(json.decode(str));

String visitorListModelToJson(VisitorListModel data) => json.encode(data.toJson());

class VisitorListModel {
    VisitorListModel({
        this.data,
        this.msg,
        this.success,
    });

    List<Visitor>? data;
    String? msg;
    bool? success;

    factory VisitorListModel.fromJson(Map<String, dynamic> json) => VisitorListModel(
        data: List<Visitor>.from(json["data"].map((x) => Visitor.fromJson(x))),
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "success": success,
    };
}

class Visitor {
    Visitor({
        this.id,
        this.fullname,
        this.city,
        this.contactno,
        this.usertype,
    });

    String? id;
    String? fullname;
    String? city;
    String? contactno;
    String? usertype;

    factory Visitor.fromJson(Map<String, dynamic> json) => Visitor(
        id: json["_id"],
        fullname: json["fullname"],
        city: json["city"],
        contactno: json["contactno"],
        usertype: json["usertype"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "city": city,
        "contactno": contactno,
        "usertype": usertype,
    };
}
