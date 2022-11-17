import 'package:flutter/material.dart';

class Buttons {
  static RoundButton(String title, BuildContext context) {
    TextButton(onPressed: () {}, child: Text(title));
  }
}
