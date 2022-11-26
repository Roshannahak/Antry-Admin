import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';

class StudentLogViewHolder extends StatefulWidget {
  StudentLogViewHolder(
      {Key? key,
      required this.date,
      required this.name,
      required this.branch,
      required this.roomNo,
      required this.inTime,
      required this.outTime})
      : super(key: key);

  final String date;
  final String name;
  final String branch;
  final String roomNo;
  final String inTime;
  final String outTime;

  @override
  State<StudentLogViewHolder> createState() => _LogViewHolderState();
}

class _LogViewHolderState extends State<StudentLogViewHolder> {
  bool isHovered = false;
  onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 14, right: 10),
          decoration: BoxDecoration(
              color: isHovered ? AppColor.hoverGrey : Colors.white),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  widget.date,
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
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                child: Text(
                  widget.roomNo,
                  textAlign: TextAlign.center,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                child: Text(
                  widget.inTime,
                  textAlign: TextAlign.center,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                child: Text(
                  widget.outTime,
                  textAlign: TextAlign.center,
                  style: tableRowTextStyle(),
                ),
              )
            ],
          )),
    );
  }
}
