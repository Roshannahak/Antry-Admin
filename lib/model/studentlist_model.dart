// To parse this JSON data, do
//
//     final studentListModel = studentListModelFromJson(jsonString);

import 'dart:convert';

StudentListModel studentListModelFromJson(String str) => StudentListModel.fromJson(json.decode(str));

String studentListModelToJson(StudentListModel data) => json.encode(data.toJson());

class StudentListModel {
    StudentListModel({
        this.data,
        this.msg,
        this.success,
    });

    List<Student>? data;
    String? msg;
    bool? success;

    factory StudentListModel.fromJson(Map<String, dynamic> json) => StudentListModel(
        data: List<Student>.from(json["data"].map((x) => Student.fromJson(x))),
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "success": success,
    };
}

class Student {
    Student({
        this.id,
        this.fullname,
        this.rollno,
        this.branch,
        this.course,
        this.semester,
        this.contactno,
        this.usertype,
    });

    String? id;
    String? fullname;
    String? rollno;
    String? branch;
    String? course;
    String? semester;
    String? contactno;
    String? usertype;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"],
        fullname: json["fullname"],
        rollno: json["rollno"],
        branch: json["branch"],
        course: json["course"],
        semester: json["semester"].toString(),
        contactno: json["contactno"],
        usertype: json["usertype"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "rollno": rollno,
        "branch": branch,
        "course": course,
        "semester": semester,
        "contactno": contactno,
        "usertype": usertype,
    };
}
