import 'package:flutter/material.dart';

class MyStyle {
    Widget detail(String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              '$title : ',
              style: const TextStyle(fontSize: 18),
            )),
        Expanded(
          flex: 1,
          child: Text(
            data,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}