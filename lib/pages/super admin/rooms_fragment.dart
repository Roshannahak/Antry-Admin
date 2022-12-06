import 'package:antry_admin/components/super%20admin/room_widget.dart';
import 'package:antry_admin/controller/roomlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomsFragment extends StatefulWidget {
  RoomsFragment({Key? key}) : super(key: key);

  @override
  State<RoomsFragment> createState() => _RoomsFragmentState();
}

class _RoomsFragmentState extends State<RoomsFragment> {
  @override
  void initState() {
    super.initState();
    Provider.of<RoomListProvider>(context, listen: false)
        .fetchRoomListProvider();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RoomListProvider>(context);
    return Row(
      children: [
        Expanded(
            flex: 6,
            child: roomListWidget(context: context, provider: provider)),
        SizedBox(width: 14),
        Expanded(flex: 4, child: qrPrintPreview()),
      ],
    );
  }
}
