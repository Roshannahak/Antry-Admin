import 'package:flutter/material.dart';

class ProfileFragment extends StatefulWidget {
  ProfileFragment({Key? key}) : super(key: key);

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("profile page"),
      ),
    );
  }
}