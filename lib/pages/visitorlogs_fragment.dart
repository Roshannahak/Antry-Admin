import 'package:flutter/material.dart';

class VisitorLogsFragment extends StatefulWidget {
  VisitorLogsFragment({Key? key}) : super(key: key);

  @override
  State<VisitorLogsFragment> createState() =>
      _VisitorLogsFragmentState();
}

class _VisitorLogsFragmentState extends State<VisitorLogsFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("visitor logs"),
      ),
    );
  }
}
