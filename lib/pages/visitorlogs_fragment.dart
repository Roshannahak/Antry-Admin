import 'package:antry_admin/controller/visitorlist_provider.dart';
import 'package:antry_admin/controller/visitorlog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/visitorlog_widget.dart';

class VisitorLogsFragment extends StatefulWidget {
  VisitorLogsFragment({Key? key}) : super(key: key);

  @override
  State<VisitorLogsFragment> createState() => _VisitorLogsFragmentState();
}

class _VisitorLogsFragmentState extends State<VisitorLogsFragment> {
  @override
  void initState() {
    super.initState();
    Provider.of<VisitorLogProvider>(context, listen: false)
        .fetchVisitorLogProvider();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VisitorLogProvider>(context);
    return Row(
      children: [
        Expanded(flex: 7, child: visitorLogListWidget(provider: provider)),
        SizedBox(width: 14),
        Expanded(flex: 3, child: visitorLogDetailsWidget()),
      ],
    );
  }
}
