import 'package:antry_admin/components/super%20admin/admin_widget.dart';
import 'package:flutter/material.dart';

class AdminFragment extends StatefulWidget {
  AdminFragment({Key? key}) : super(key: key);

  @override
  State<AdminFragment> createState() => _AdminFragmentState();
}

class _AdminFragmentState extends State<AdminFragment> {
  @override
  Widget build(BuildContext context) {
    return adminListWidget();
  }
}
