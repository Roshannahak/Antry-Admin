import 'package:antry_admin/components/studentfragment_widgets.dart';
import 'package:flutter/material.dart';

class StudentsFragment extends StatefulWidget {
  StudentsFragment({Key? key}) : super(key: key);

  @override
  State<StudentsFragment> createState() => _StudentsFragmentState();
}

class _StudentsFragmentState extends State<StudentsFragment> {
  @override
  Widget build(BuildContext context) {
    return studentListWidget();
  }
}
