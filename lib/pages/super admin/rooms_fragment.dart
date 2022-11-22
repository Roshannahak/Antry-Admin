import 'package:flutter/material.dart';

class RoomsFragment extends StatefulWidget {
  RoomsFragment({Key? key}) : super(key: key);

  @override
  State<RoomsFragment> createState() => _RoomsFragmentState();
}

class _RoomsFragmentState extends State<RoomsFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Rooms page"),),);
  }
}