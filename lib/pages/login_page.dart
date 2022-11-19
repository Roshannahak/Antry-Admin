import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Text("hello flutter web"),
        ),
      ),
    );
  }
}
