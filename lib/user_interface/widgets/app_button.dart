import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final double height;
  final double width;
  final double elevation;
  final bool isLoading;
  final Function onTap;
  final Color bgColor;
  final Color textColor;

  AppButton(
      {@required this.label,
      @required this.onTap,
      this.bgColor,
      this.textColor,
      this.height,
      this.width,
      this.elevation,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity, height: height ?? 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation ?? 0,
            primary: bgColor ?? Color(0xFF6576ff),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onTap,
        child: !isLoading
            ? Text(
                label,
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            : CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
      ),
    );
  }
}
