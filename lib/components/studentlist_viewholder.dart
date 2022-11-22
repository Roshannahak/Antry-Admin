import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';
class StudentViewHolder extends StatefulWidget {
  StudentViewHolder({Key? key, required this.rollno,
        required this.name,
        required this.branch,
        required this.course,
        required this.semester,
        required this.contactno}) : super(key: key);

        final String rollno;
        final String name;
        final String branch;
        final String course;
        final String semester;
        final String contactno; 

  @override
  State<StudentViewHolder> createState() => _StudentViewHolderState();
}

class _StudentViewHolderState extends State<StudentViewHolder> {
  bool _isHovered = false;
  OnEntered(bool isHovered){
    setState(() {
      _isHovered = isHovered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return 

    MouseRegion(
      onEnter: (event) => OnEntered(true),
      onExit: (event) => OnEntered(false),
      child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 14, right: 10),
          decoration: BoxDecoration(color: _isHovered ? AppColor.hoverGrey : Colors.white),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  widget.rollno,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.name,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                child: Text(
                  widget.branch,
                  textAlign: TextAlign.center,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                child: Text(
                  widget.course,
                  textAlign: TextAlign.center,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                child: Text(
                  widget.semester,
                  textAlign: TextAlign.center,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.contactno,
                  textAlign: TextAlign.center,
                  style: tableRowTextStyle(),
                ),
              )
            ],
          )),
    );}}
