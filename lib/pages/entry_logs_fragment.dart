import 'package:flutter/material.dart';

class EntryLogsFragment extends StatefulWidget {
  EntryLogsFragment({Key? key}) : super(key: key);

  @override
  State<EntryLogsFragment> createState() => _EntryLogsFragmentState();
}

class _EntryLogsFragmentState extends State<EntryLogsFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("entry logs page"),
      ),
    );
  }
}