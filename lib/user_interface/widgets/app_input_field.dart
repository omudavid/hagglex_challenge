import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final Color color;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final Function(String) onSaved;
  final Function validator;

  AppInputField(
      {Key key,
      this.color,
      this.controller,
      this.hintText,
      this.onSaved,
      this.validator,
      this.obscureText = false,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        style: TextStyle(color: color, fontSize: 13),
        cursorColor: color,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 1, style: BorderStyle.solid, color: color),
          ),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 1, style: BorderStyle.solid, color: color),
          ),
          hintStyle: TextStyle(color: color),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 1, style: BorderStyle.solid, color: color),
          ),
        ),
      ),
    );
  }
}
