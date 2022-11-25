import 'package:flutter/material.dart';

class VisitorFragment extends StatefulWidget {
  VisitorFragment({Key? key}) : super(key: key);

  @override
  State<VisitorFragment> createState() => _VisitorFragmentState();
}

class _VisitorFragmentState extends State<VisitorFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("visitor fragment"),
      ),
    );
  }
}
