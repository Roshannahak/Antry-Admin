import 'package:flutter/material.dart';

import '../components/visitorlog_widget.dart';

class VisitorLogsFragment extends StatefulWidget {
  VisitorLogsFragment({Key? key}) : super(key: key);

  @override
  State<VisitorLogsFragment> createState() =>
      _VisitorLogsFragmentState();
}

class _VisitorLogsFragmentState extends State<VisitorLogsFragment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 7, child: visitorLogListWidget()),
        SizedBox(width: 14),
        Expanded(flex: 3, child: visitorLogDetailsWidget()),
      ],
    );
  }
}
