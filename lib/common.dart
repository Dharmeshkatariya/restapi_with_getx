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
          )
        ),
      ),
    );
  }
}
