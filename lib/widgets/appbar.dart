import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appbar(String title) {
  return AppBar(
    title: Text(title),
    actions: [
      Icon(Icons.person),
    ],
  );
}
