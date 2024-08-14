import 'package:flutter/material.dart';

class TextInputDecoration extends InputDecoration {
  const TextInputDecoration.common(labelText, {Widget? suffix})
      : super(
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 240, 69, 69), width: 1.0)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 240, 69, 69), width: 1.0)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0)),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            suffix: suffix);
}
