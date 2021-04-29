import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  AppBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
        child: child,
      ),
    );
  }
}
