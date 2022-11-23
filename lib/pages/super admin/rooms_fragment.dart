import 'package:antry_admin/components/super%20admin/room_widget.dart';
import 'package:flutter/material.dart';

class RoomsFragment extends StatefulWidget {
  RoomsFragment({Key? key}) : super(key: key);

  @override
  State<RoomsFragment> createState() => _RoomsFragmentState();
}

class _RoomsFragmentState extends State<RoomsFragment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 6, child: roomListWidget()),
        SizedBox(width: 14),
        Expanded(flex: 4, child: qrPrintPreview()),
      ],
    );
  }
}
