import 'package:flutter/material.dart';
import 'package:ilabtest/utill/constant.dart';

class TButtonStyle extends ButtonStyle {
  TButtonStyle.common()
      : super(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 16)),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius))));
}
