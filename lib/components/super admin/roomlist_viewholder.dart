import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';

class RoomViewHolder extends StatefulWidget {
  RoomViewHolder({
    Key? key,
    required this.roomno,
    required this.roomname,
    required this.department,
  }) : super(key: key);

  final String roomno;
  final String roomname;
  final String department;

  @override
  State<RoomViewHolder> createState() => _StudentViewHolderState();
}

class _StudentViewHolderState extends State<RoomViewHolder> {
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
                  widget.roomno,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.roomname,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.department,
                  style: tableRowTextStyle(),
                ),
              ),
            ],
          )),
    );
  }
}
