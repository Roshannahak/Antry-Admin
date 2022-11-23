import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';

class AdminViewHolder extends StatefulWidget {
  AdminViewHolder(
      {Key? key,
      required this.empid,
      required this.name,
      required this.department,
      required this.contactno})
      : super(key: key);

  final String empid;
  final String name;
  final String department;
  final String contactno;

  @override
  State<AdminViewHolder> createState() => _StudentViewHolderState();
}

class _StudentViewHolderState extends State<AdminViewHolder> {
  bool _isHovered = false;
  OnEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => OnEntered(true),
      onExit: (event) => OnEntered(false),
      child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 14, right: 10),
          decoration: BoxDecoration(
              color: _isHovered ? AppColor.hoverGrey : Colors.white),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.empid,
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
                flex: 2,
                child: Text(
                  widget.department,
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
    );
  }
}
