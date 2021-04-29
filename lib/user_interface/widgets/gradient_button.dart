import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final double height;
  final double width;
  final bool isLoading;
  final double elevation;
  final Function onTap;
  final Color bgColor;
  final Color textColor;

  GradientButton(
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            elevation: 0,
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: onTap,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF432B7B),
                Color(0xFF6A4BBC),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(
                minWidth: 88.0,
                minHeight: 36.0), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: !isLoading
                  ? Text(
                      label,
                      style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    )
                  : CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
            ),
          ),
        ),
      ),
    );
    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E1963),
              Color(0xFF3B2671),
              Color(0xFF2E1963),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 0.3, 0.4],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 88.0,
              minHeight: 36.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: const Text(
            'OK',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity, height: height ?? 50),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E1963),
              Color(0xFF3B2671),
              Color(0xFF2E1963),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 0.3, 0.4],
            tileMode: TileMode.clamp,
          ),
        ),
        child: RaisedButton(
          // style: ElevatedButton.styleFrom(
          //     elevation: elevation ?? 0,
          //     primary: bgColor ?? Color(0xFF6576ff),
          //     shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          onPressed: onTap,
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2E1963),
                  Color(0xFF3B2671),
                  Color(0xFF2E1963),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.3, 0.4],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Container(
              child: Text(
                label,
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
