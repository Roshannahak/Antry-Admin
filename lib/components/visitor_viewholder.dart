import 'package:antry_admin/components/style.dart';
import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';

class VisitorViewHolder extends StatefulWidget {
  VisitorViewHolder(
      {Key? key,
      required this.name,
      required this.city,
      required this.contactno})
      : super(key: key);

  final String name;
  final String city;
  final String contactno;

  @override
  State<VisitorViewHolder> createState() => _VisitorViewHolderState();
}

class _VisitorViewHolderState extends State<VisitorViewHolder> {
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
                flex: 2,
                child: Text(
                  widget.name,
                  style: tableRowTextStyle(),
                ),
              ),
              Expanded(
                child: Text(
                  widget.city,
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
