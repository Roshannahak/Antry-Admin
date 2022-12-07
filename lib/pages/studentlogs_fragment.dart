import 'package:antry_admin/components/studentlog_widget.dart';
import 'package:antry_admin/controller/studentlog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentLogsFragment extends StatefulWidget {
  StudentLogsFragment({Key? key}) : super(key: key);

  @override
  State<StudentLogsFragment> createState() => _StudentLogsFragmentState();
}

class _StudentLogsFragmentState extends State<StudentLogsFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<StudentLogProvider>(context, listen: false)
        .fetchStudentLogProvider();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentLogProvider>(context);
    return Row(
      children: [
        Expanded(flex: 7, child: studentLogListWidget(provider: provider)),
        SizedBox(width: 14),
        Expanded(flex: 3, child: studentLogDetailsWidget()),
      ],
    );
  }
}
