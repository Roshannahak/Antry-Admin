import 'package:antry_admin/components/entrylog_widget.dart';
import 'package:flutter/material.dart';

class EntryLogsFragment extends StatefulWidget {
  EntryLogsFragment({Key? key}) : super(key: key);

  @override
  State<EntryLogsFragment> createState() => _EntryLogsFragmentState();
}

class _EntryLogsFragmentState extends State<EntryLogsFragment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 7, child: logsListWidget()),
        Expanded(flex: 3, child: Container()),
      ],
    );
  }
}
