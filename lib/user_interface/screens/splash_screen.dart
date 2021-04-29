import 'package:flutter/material.dart';
import 'package:hagglex/user_interface/widgets/app_background.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/hagglex_logo.png',
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'HaggleX',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
