import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: InkWell(
        child: Container(
          height: 50,
          width: 70,
          decoration: BoxDecoration(
              color: Color(0xFF604D93),
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
