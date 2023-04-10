import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common {
  static Widget textForm(
      {TextEditingController? controller,
      String? text,
      Widget? preicon,
      TextInputType? keyboardType,
      dynamic validator}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            prefixIcon: preicon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }

  static Widget button({required String text, Color? textcolor, Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w400, color: textcolor, fontSize: 16),
      ),
    );
  }
}
