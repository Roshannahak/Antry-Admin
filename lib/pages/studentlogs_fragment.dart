import 'package:antry_admin/components/studentlog_widget.dart';
import 'package:flutter/material.dart';

class StudentLogsFragment extends StatefulWidget {
  StudentLogsFragment({Key? key}) : super(key: key);

  @override
  State<StudentLogsFragment> createState() => _StudentLogsFragmentState();
}

class _StudentLogsFragmentState extends State<StudentLogsFragment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 7, child: studentLogListWidget()),
        SizedBox(width: 14),
        Expanded(flex: 3, child: studentLogDetailsWidget()),
      ],
    );
  }
}
