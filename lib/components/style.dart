import 'package:flutter/material.dart';

InputDecoration loginTextFieldDecoration({required String leble}) => InputDecoration(
    isDense: true,
    labelText: leble,
    labelStyle: TextStyle(color: Colors.black),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.black, width: 1.5)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)));
