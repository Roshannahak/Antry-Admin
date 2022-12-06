import 'package:antry_admin/components/studentfragment_widgets.dart';
import 'package:antry_admin/controller/studentlist_provider.dart';
import 'package:antry_admin/services/network/api_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsFragment extends StatefulWidget {
  StudentsFragment({Key? key}) : super(key: key);

  @override
  State<StudentsFragment> createState() => _StudentsFragmentState();
}

class _StudentsFragmentState extends State<StudentsFragment> {
  @override
  void initState() {
    super.initState();
    Provider.of<StudentListProvider>(context, listen: false).fetchStudentListProvider();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentListProvider>(context);
    return studentListWidget(provider: provider, context: context);
  }
}
