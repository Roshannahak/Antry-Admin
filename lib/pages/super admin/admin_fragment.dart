import 'package:flutter/material.dart';

class AdminFragment extends StatefulWidget {
  AdminFragment({Key? key}) : super(key: key);

  @override
  State<AdminFragment> createState() => _AdminFragmentState();
}

class _AdminFragmentState extends State<AdminFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("admin page"),
      ),
    );
  }
}
