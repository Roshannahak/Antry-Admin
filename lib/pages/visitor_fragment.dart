import 'package:antry_admin/components/visitorfragment_widgets.dart';
import 'package:flutter/material.dart';

class VisitorFragment extends StatefulWidget {
  VisitorFragment({Key? key}) : super(key: key);

  @override
  State<VisitorFragment> createState() => _VisitorFragmentState();
}

class _VisitorFragmentState extends State<VisitorFragment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 6, child: visitorListWidget()),
        Expanded(child: Container())
      ],
    );
  }
}
